class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def index
    @users = User.all
  end

  # def filter
  #   # raise
  #   @users = User.where("name LIKE '%#{params[:name]}%'")
  #   # ("name LIKE '#{params[:name]}'")
  # end


  def show
    @joins = @user.joins
    @purchase = []
    @supply = []
    @ci = []
    @management = []

    @level_real_count = [0,0,0,0,0]

    @target_validation = 0
    @target_referent = 0
    @real_validation = 0
    @real_referent = 0

    classes = ["color: grey", "color: green", "color: blue", "color: orange", "color: red"]

    @joins.each do |j|
      level_real = j.real_level
      @level_real_count[level_real] += 1
      level_target = j.target_level

      if level_target > 2
        @target_validation += 1
        if level_target == 4
          @target_referent += 1
        end
      end

      if level_real > 2
        @real_validation += 1
        if level_real == 4
          @real_referent += 1
        end
      end

      color_real = classes[level_real]
      color_target = classes[level_target]

      case j.competency.domain.name.upcase
        when "PURCHASE"
          @purchase << [j, color_real, color_target]
        when "SUPPLY"
          @supply << [j, color_real, color_target]
        when "CI"
          @ci << [j, color_real, color_target]
        when "MANAGEMENT"
          @management << [j, color_real, color_target]
      end
    end

    @user_dashboard = [["Purchase", @purchase], ["Supply", @supply], ["CI", @ci], ["management", @management]]
    # @doses = Dose.where(user_id: params[:id])
  end

  def team_dashboard
    domains = Domain.all
    @data = {
      # [target(overall),real(overall),real/target,validation target,v real, v rate, referent target, r real, r rate]
      china: {total: [0,0,0,0,0,0,0,0,0], purchase:[0,0,0,0,0,0,0,0,0], supply:[0,0,0,0,0,0,0,0,0], ci:[0,0,0,0,0,0,0,0,0], management:[0,0,0,0,0,0,0,0,0]},
      north: {total: [0,0,0,0,0,0,0,0,0], purchase:[0,0,0,0,0,0,0,0,0], supply:[0,0,0,0,0,0,0,0,0], ci:[0,0,0,0,0,0,0,0,0], management:[0,0,0,0,0,0,0,0,0]},
      south: {total: [0,0,0,0,0,0,0,0,0], purchase:[0,0,0,0,0,0,0,0,0], supply:[0,0,0,0,0,0,0,0,0], ci:[0,0,0,0,0,0,0,0,0], management:[0,0,0,0,0,0,0,0,0]},
      import: {total: [0,0,0,0,0,0,0,0,0], purchase:[0,0,0,0,0,0,0,0,0], supply:[0,0,0,0,0,0,0,0,0], ci:[0,0,0,0,0,0,0,0,0], management:[0,0,0,0,0,0,0,0,0]}
    }
    domains.each do |d|
      competencies = d.competencies
      competencies.each do |c|
        joins = c.joins
        joins.each do |j|
          if j.user.team.name.downcase != 'direction'
            @data[:china][d.name.downcase.to_sym][0] += 1
            @data[:china][d.name.downcase.to_sym][1] += 1 if j.real_level >= j.target_level
            @data[:china][:total][0] += j.target_level
            @data[:china][:total][1] += j.real_level
            @data[j.user.team.name.downcase.to_sym][d.name.downcase.to_sym][0] += 1
            @data[j.user.team.name.downcase.to_sym][d.name.downcase.to_sym][1] += 1 if j.real_level >= j.target_level
            @data[j.user.team.name.downcase.to_sym][:total][0] += j.target_level
            @data[j.user.team.name.downcase.to_sym][:total][1] += j.real_level
            if j.target_level > 2
              # validation count
              @data[:china][d.name.downcase.to_sym][3] += 1
              @data[:china][d.name.downcase.to_sym][4] += 1 if j.real_level > 2
              @data[:china][:total][3] += 1
              @data[:china][:total][4] += 1 if j.real_level > 2
              @data[j.user.team.name.downcase.to_sym][d.name.downcase.to_sym][3] += 1
              @data[j.user.team.name.downcase.to_sym][d.name.downcase.to_sym][4] += 1 if j.real_level > 2
              @data[j.user.team.name.downcase.to_sym][:total][3] += 1
              @data[j.user.team.name.downcase.to_sym][:total][4] += 1 if j.real_level > 2
              if j.target_level == 4
                @data[:china][d.name.downcase.to_sym][6] += 1
                @data[:china][d.name.downcase.to_sym][7] += 1 if j.real_level == 4
                @data[:china][:total][6] += 1
                @data[:china][:total][7] += 1 if j.real_level == 4
                @data[j.user.team.name.downcase.to_sym][d.name.downcase.to_sym][6] += 1
                @data[j.user.team.name.downcase.to_sym][d.name.downcase.to_sym][7] += 1 if j.real_level == 4
                @data[j.user.team.name.downcase.to_sym][:total][6] += 1
                @data[j.user.team.name.downcase.to_sym][:total][7] += 1 if j.real_level == 4
              end
            end

          end
        end
      end
    end

    @data.each do |k,v|
      v.each do |k,v|
        v[2] = v[1]/v[0]
        v[5] = v[4]/v[3]
        v[8] = v[7]/v[6]
      end
    end
    gon.data = @data
    puts @data
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to user_path(@user)
  #   else
  #     render :new
  #   end
  #   # @user.save
  #   # redirect_to users_path(@user)
  # end

  # def edit
  # end

  # def update
  #   @user.update(user_params)
  #   if @user.update(user_params)
  #     redirect_to user_path(@user)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @user.delete
  #   redirect_to users_path
  # end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
