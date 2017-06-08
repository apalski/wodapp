# coding: utf-8
DATA = {
  :user_keys =>
    ["name", "email", "password", "admin"],
  :users => [
    ["Max Charles", "max@gmail.com", "friedfish", true],
    ["Skai Jackson", "skai@gmail.com", "frenchfries", false],
    ["Kaleo Elam", "kaleo@gmail.com", "muddypond", false],
    ["Megan Charpentier", "megan@gmail.com", "kermit124", false],
    ["Hayden Byerly", "hayden@gmail.com", "sausageroll", false],
    ["Tenzing Norgay Trainor", "tenzing@gmail.com", "specialegg", false],
    ["Davis Cleveland", "davis@gmail.com", "mintslice", false],
    ["Cole Sand", "cole@gmail.com", "cravingmore", false],
    ["Quvenzhané Wallis", "quv@gmail.com", "passionpop", true]
  ],
  :usermovement_keys =>
   ["name", "date", "movement_type", "result", "pr"],
  :usermovements => [
    ["Dead Lift", Date.today,"weight", 100, true],
    ["Clean & Jerk", Date.today, "weight", 45, false],
    ["Push Jerk", Date.today, "weight", 38, false],
    ["Push Press", Date.today, "weight", 35, true],
    ["Snatch", Date.today, "weight", 33, false],
    ["400m Run", Date.today, "time", 1.36, true],
    ["Burpees", Date.today, "repetitions", 35, false],
    ["Air Squats", Date.today, "repetitions", 50, false],
    ["Box Jumps", Date.today, "repetitions", 25, true]
  ],

  :userwod_keys =>
    ["name", "date", "wod_type", "result", "pr"],
  :userwods => [
    ["Helen", Date.today, 5.01, "time", true],
    ["Grace", Date.today, 4.85, "time", false],
    ["Dead Lift Day", Date.today, 100, "weight", true],
    ["Murph", Date.today, 25, "time", false],
    ["Karen", Date.today, 160, "repetitions", true]
  ] 
}

def main
  make_users
  make_movements
  make_wods
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_movements
  DATA[:usermovements].each do |movement|
    new_movement = Usermovement.new
    movement.each_with_index do |attribute, i|
      new_movement.send(DATA[:usermovement_keys][i]+"=", attribute)
    end
    new_movement.save
  end
end

def make_wods
  DATA[:userwods].each do |wod|
    new_wod = Userwod.new
    wod.each_with_index do |attribute, i|
      new_wod.send(DATA[:userwod_keys][i]+"=", attribute)
    end
    new_wod.save
  end
end

main
