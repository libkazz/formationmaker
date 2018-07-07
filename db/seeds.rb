goal = { top: 410 }
back = { top: 300 }
diffencive_half = { top: 200 }
half = { top: 150 }
offencive_half = { top: 120 }
shadow = { top: 70 }
top = { top: 10 }

wide_right = { left: 510 }
right = { left: 470 }
inside_right =  { left: 380 }
central_right = { left: 340 }
center = { left: 270 }
central_left = { left: 200 }
inside_left = { left: 160 }
left = { left: 70 }
wide_left = { left: 30 }

five_back = {
  '1' => goal.merge(center),
  '2' => back.merge(inside_right),
  '3' => back.merge(center),
  '4' => back.merge(inside_left),
  '5' => back.merge(wide_right),
  '6' => back.merge(wide_left),
}

four_back = {
  '1' => goal.merge(center),
  '2' => back.merge(central_left),
  '3' => back.merge(central_right),
  '4' => back.merge(right),
  '5' => back.merge(left),
}

three_back = {
  '1' => goal.merge(center),
  '2' => back.merge(inside_right),
  '3' => back.merge(center),
  '4' => back.merge(inside_left),
}

shallow_three_top = {
  '9' => top.merge(inside_left),
  '10' => top.merge(center),
  '11' => top.merge(inside_right),
}

three_top = {
  '9' => top.merge(left),
  '10' => top.merge(center),
  '11' => top.merge(right),
}

two_top = {
  '10' => top.merge(central_right),
  '11' => top.merge(central_left),
}

one_top = {
  '11' => top.merge(center),
}

one_top_two_shadow = {
  '9' => shadow.merge(inside_right),
  '10' => shadow.merge(inside_left),
  '11' => top.merge(center),
}

Formation.find_or_create_by(name: '4-1-2-3') do |f|
  f.positions = four_back.merge(
    '6' => diffencive_half.merge(center),
    '7' => offencive_half.merge(inside_right),
    '8' => offencive_half.merge(inside_left)
  ).merge(three_top)
end

Formation.find_or_create_by(name: '4-2-1-3') do |f|
  f.positions = four_back.merge(
    '6' => diffencive_half.merge(inside_right),
    '7' => diffencive_half.merge(inside_left),
    '8' => offencive_half.merge(center)
  ).merge(three_top)
end

Formation.find_or_create_by(name: '4-2-3-1') do |f|
  f.positions = four_back.merge(
    '6' => diffencive_half.merge(inside_right),
    '7' => diffencive_half.merge(inside_left),
    '8' => offencive_half.merge(wide_right),
    '9' => offencive_half.merge(wide_left),
    '10' => offencive_half.merge(center)
  ).merge(one_top)
end

Formation.find_or_create_by(name: '4-3-2-1') do |f|
  f.positions = four_back.merge(
    '6' => diffencive_half.merge(inside_right),
    '7' => diffencive_half.merge(center),
    '8' => diffencive_half.merge(inside_left)
  ).merge(one_top_two_shadow)
end

Formation.find_or_create_by(name: '4-4-2') do |f|
  f.positions = four_back.merge(
    '6' => half.merge(right),
    '7' => half.merge(central_right),
    '8' => half.merge(central_left),
    '9' => half.merge(left)
  ).merge(two_top)
end

Formation.find_or_create_by(name: '3-4-3') do |f|
  f.positions = three_back.merge(
    '5' => half.merge(right),
    '6' => half.merge(central_right),
    '7' => half.merge(central_left),
    '8' => half.merge(left)
  ).merge(shallow_three_top)
end

Formation.find_or_create_by(name: '3-4-2-1') do |f|
  f.positions = three_back.merge(
    '5' => diffencive_half.merge(right),
    '6' => diffencive_half.merge(central_right),
    '7' => diffencive_half.merge(central_left),
    '8' => diffencive_half.merge(left)
  ).merge(one_top_two_shadow)
end

Formation.find_or_create_by(name: '5-4-1') do |f|
  f.positions = five_back.merge(
    '7' => half.merge(right),
    '8' => half.merge(central_right),
    '9' => half.merge(central_left),
    '10' => half.merge(left)
  ).merge(one_top)
end
