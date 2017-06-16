# coding: utf-8
DATA = {
  :user_keys =>
    ["name", "email", "password", "owner"],
  :users => [
    ["Max Charles", "max@gmail.com", "friedfish", true],
    ["Skai Jackson", "skai@gmail.com", "frenchfries", false],
    ["Kaleo Elam", "kaleo@gmail.com", "muddypond", false],
    ["Megan Charpentier", "megan@gmail.com", "kermit124", false],
    ["Hayden Byerly", "hayden@gmail.com", "sausageroll", false],
    ["Tenzing Norgay Trainor", "tenzing@gmail.com", "specialegg", false],
    ["Davis Cleveland", "davis@gmail.com", "mintslice", false],
    ["Cole Sand", "cole@gmail.com", "cravingmore", false],
    ["Quvenzhané Wallis", "quv@gmail.com", "passionpop", false]
  ],
  :movement_keys =>
   ["name", "movement_type", "quantity", "owner_id"],
  :movements => [
    ["Dead Lift", "weight", 10, 1],
    ["Clean & Jerk", "weight", 8, 1],
    ["Push Jerk", "weight", 10, 1],
    ["Push Press", "weight", 11, 1],
    ["Snatch", "weight", 9, 1],
    ["400m Run", "time", 1, 1],
    ["Burpees", "repetitions", 30, 1],
    ["Air Squats", "repetitions", 50, 1],
    ["Box Jumps", "repetitions", 20, 1]
  ],

  :wod_keys =>
    ["title", "wod_type", "description", "owner_id"],
  :wods => [
    ["Helen", "time", "15 minute cap", "1"],
    ["Grace", "time", "10 minute cap", 1],
    ["Dead Lift Day", "weight", "1RM", 1],
    ["Murph", "time", "50 minute cap", 1],
    ["Karen", "repetitions", "20 minute cap", 1]
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
  DATA[:movements].each do |movement|
    new_movement = Movement.new
    movement.each_with_index do |attribute, i|
      new_movement.send(DATA[:movement_keys][i]+"=", attribute)
    end
    new_movement.save
  end
end

def make_wods
  DATA[:wods].each do |wod|
    new_wod = Wod.new
    wod.each_with_index do |attribute, i|
      new_wod.send(DATA[:wod_keys][i]+"=", attribute)
    end
    new_wod.save
  end
end

main
