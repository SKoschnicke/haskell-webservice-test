{-# LANGUAGE OverloadedStrings #-}
import Network.Wai
import Network.Wai.Handler.Warp
import Network.Wai.Middleware.Debug
import Blaze.ByteString.Builder
import Blaze.ByteString.Builder.Char.Utf8 (fromChar)
import Data.Monoid (mconcat)
import Network.HTTP.Types (status200)
import qualified Data.ByteString.Char8 as B

import System.Log.Logger
import System.Log.Handler.Simple


my_app :: Application -- type Application = Request -> Iteratee ByteString IO Response
my_app request =
    return $ ResponseBuilder -- Constructor for data Response: ResponseBuilder Status ResponseHeaders Builder
      status200
      [("Content-Type", "text/plain")]
      --(fromByteString $ mconcat (fromChar (replicate 4000 "a")))
      (fromByteString $ B.replicate 4000000 'a')
    where
      message :: B.ByteString
      message = "Hello World"

main = run 3000 $ debug my_app
