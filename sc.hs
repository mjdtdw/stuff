-- нумерация монет начинается с 1, а списков с 0
toIndex n = n - 1
-- получение веса монеты по её номеру
getWeight w n = w !! (toIndex n)
-- получение весов монет в списке
getWeights w xs = map (getWeight w) xs
-- суммирование весов монет в списке
sumWeights w xs = sum (getWeights w xs)

-- тип легче - равны - тяжелее
data Weight = Light | Equal | Heavy

-- собственно взвешивание
scales :: [Int] -> [Int] -> [Int] -> Weight
scales w xs ys =
  case compare (sumWeights w xs) (sumWeights w ys) of
    LT -> Light
    EQ -> Equal
    GT -> Heavy

-- спижжено с http://games.harrix.org/article/611
solution w = do
  putStrLn "1 scale 1 2 3 4 and 5 6 7 8"
  case scales w [1,2,3,4]  [5,6,7,8] of
    Light -> do
      putStrLn "2 scale 1 2 5 and 3 6 9"
      case scales w [1,2,5] [3,6,9] of
        Light -> do
          putStrLn "3 scale 1 and 2"
          case scales w [1] [2] of
            Light -> print 1
            Equal -> print 6
            Heavy -> print 2
        Equal -> do
          putStrLn "3 scale 7 8"
          case scales w [7] [8] of
            Light -> print 8
            Equal -> print 4
            Heavy -> print 7
        Heavy -> do
          putStrLn "3 scale 3 9"
          case scales w [3] [9] of
            Light -> print 3
            Equal -> print 5
            Heavy -> print 3
    Equal -> do
      putStrLn "2 scale 1 2 3 and 9 10 11"
      case scales w [1,2,3] [9,10,11] of
        Light -> do
          putStrLn "3 scale 9 and 10"
          case scales w [9] [10] of
            Light -> print 10
            Equal -> print 11
            Heavy -> print 9
        Equal -> do
          putStrLn "3 scale 1 and 12"
          case scales w [1] [12] of
            Light -> print 12
            Equal -> print 13
            Heavy -> print 12
        Heavy -> do
          putStrLn "3 scale 9 and 10"
          case scales w [9] [10] of
            Light -> print 9
            Equal -> print 11
            Heavy -> print 10
    Heavy -> do
      putStrLn "2 scale 1 2 5 and 3 6 9"
      case scales w [1,2,5] [3,6,9] of
        Light -> do
          putStrLn "3 scale 3 and 9"
          case scales w [3] [9] of
            Light -> print 3
            Equal -> print 5
            Heavy -> print 3
        Equal -> do
          putStrLn "3 scale 7 and 8"
          case scales w [7] [8] of
            Light -> print 7
            Equal -> print 4
            Heavy -> print 8
        Heavy -> do
          putStrLn "3 scale 1 and 2"
          case scales w [1] [2] of
            Light -> print 2
            Equal -> print 6
            Heavy -> print 1

cast :: String -> [Int]
cast str = map read (words str)

-- главная функция
main = do
  putStrLn "Enter 13 weight monet splited space"
  input <- getLine
  let weights = cast input in
    if length weights == 13
       then solution weights
       else putStrLn "Wrong count weights"
