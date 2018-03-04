module HelloSomethingSpec where

import Test.Hspec
import HelloSomething (helloSomething)

spec :: Spec
spec = -- do
  describe "Toto.helloSomething" $ do
    it "world" $ -- do
      helloSomething "world" `shouldBe` "hello, world"
    it "nothing" $ -- do
      helloSomething "" `shouldBe` "hello, "
    it "w o r l d" $ -- do
      helloSomething "w" "o" "r" "l" "d" `shouldBe` "hello, w o r l d"
