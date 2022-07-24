import Data.List
import Data.Strings
import Decidable.Equality

f : (xs : List String) -> (prf : length xs = 5) -> String
f xs prf = "ok"

main : IO ()
main = do
  inp <- getLine
  xs <- pure $ words inp
  case decEq (length xs) 5 of
    Yes prf => print (f xs prf)
    No _ => print "not ok"
