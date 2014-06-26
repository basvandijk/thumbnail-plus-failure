module Main where

import Graphics.ThumbnailPlus.ImageSize
import Data.Conduit
import Data.Conduit.Binary
import System.IO
import System.Environment

main :: IO ()
main = do
  [jpgFile] <- getArgs
  mbInf <- withBinaryFile jpgFile ReadMode $ \h ->
             sourceHandle h $$ sinkImageInfo
  print mbInf
