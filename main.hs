{-# LANGUAGE OverloadedStrings #-}
import Network.Wai
import Network.Wai.Handler.Warp
import Network.Wai.Middleware.Debug
import Blaze.ByteString.Builder (fromByteString)
import Network.HTTP.Types (status200)
import qualified Data.ByteString.Char8 as B

import System.Log.Logger
import System.Log.Handler.Simple


my_app :: Application -- type Application = Request -> Iteratee ByteString IO Response
my_app request =
    return $ ResponseBuilder -- Constructor for data Response: ResponseBuilder Status ResponseHeaders Builder
      status200
      [("Content-Type", "text/plain"), ("Content-Length", B.pack(show(B.length message)))]
      (fromByteString message)
    where
      message :: B.ByteString
      message = "Hello World"

main = run 3000 $ debug my_app
