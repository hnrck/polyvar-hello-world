module Main (main) where

import HelloSomething (helloSomething)

-- |'world function. Returns world.
world :: String
world = "world"

-- |'main' function.
main :: IO ()
main = putStrLn $ helloSomething world
