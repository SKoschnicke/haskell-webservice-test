{-# LANGUAGE OverloadedStrings #-}
import Network.Wai
import Network.Wai.Handler.Warp
import Blaze.ByteString.Builder (fromByteString)
import Network.HTTP.Types (status200)
import qualified Data.ByteString.Char8 as B

main = run 3000 $ const $ return $ ResponseBuilder
    status200
    [("Content-Type", "text/plain"), ("Content-Length", B.pack(show(B.length message)))]
    (fromByteString message)
  where
    message :: B.ByteString
    message = "Hello World"
