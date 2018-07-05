module Main where

import Lib

import Sound.ProteaAudio
import Control.Concurrent(threadDelay)
import Control.Monad(when)
import qualified Data.ByteString as B

main :: IO ()
main = do
    init <- initAudio 1 22050 512
    when init $ do
        wavData <- B.readFile "Computer Error-SoundBible.com-1655839472.wav"
        sample <- sampleFromMemoryWav wavData 0.5
        soundPlay sample 0.5 0.5 0 1
        threadDelay 1000000
        finishAudio
