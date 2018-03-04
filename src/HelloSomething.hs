{-# LANGUAGE FlexibleInstances,
             FlexibleContexts,
             FunctionalDependencies,
             TypeFamilies #-}
module HelloSomething (helloSomething) where

-- |'hello' function. Returns hello.
helloMsg :: String
helloMsg = "hello"

-- | PolyVar function. Returns a concatenation of argument.
class PolyVar p a x | p -> where
  poly :: (a -> x -> x) -> a -> x -> p

instance PolyVar p a x => PolyVar (a -> p) a x where
  poly ax a x a' = poly ax a' (ax a x)

-- | PolyVar instanciation with String
instance PolyVar String String String where poly = id

-- |'helloSomething function. Returns the concatenation of hello function with the argument.
helloSomething :: PolyVar p String String => p
helloSomething = poly concatenate "" "" where
  concatenate s [] = helloMsg  ++ "," ++ s
  concatenate s str =  str ++ " " ++ s
