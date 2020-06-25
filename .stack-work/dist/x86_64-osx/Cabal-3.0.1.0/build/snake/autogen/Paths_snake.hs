{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_snake (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/zhangkai/snake/.stack-work/install/x86_64-osx/ee8de4db07d0fc4409a373398073937d76c8a58b2966e2e04da3ed97dfa7146d/8.8.3/bin"
libdir     = "/Users/zhangkai/snake/.stack-work/install/x86_64-osx/ee8de4db07d0fc4409a373398073937d76c8a58b2966e2e04da3ed97dfa7146d/8.8.3/lib/x86_64-osx-ghc-8.8.3/snake-0.1.0.0-5Wj1Gq37Y2BKkWcga6vS2a-snake"
dynlibdir  = "/Users/zhangkai/snake/.stack-work/install/x86_64-osx/ee8de4db07d0fc4409a373398073937d76c8a58b2966e2e04da3ed97dfa7146d/8.8.3/lib/x86_64-osx-ghc-8.8.3"
datadir    = "/Users/zhangkai/snake/.stack-work/install/x86_64-osx/ee8de4db07d0fc4409a373398073937d76c8a58b2966e2e04da3ed97dfa7146d/8.8.3/share/x86_64-osx-ghc-8.8.3/snake-0.1.0.0"
libexecdir = "/Users/zhangkai/snake/.stack-work/install/x86_64-osx/ee8de4db07d0fc4409a373398073937d76c8a58b2966e2e04da3ed97dfa7146d/8.8.3/libexec/x86_64-osx-ghc-8.8.3/snake-0.1.0.0"
sysconfdir = "/Users/zhangkai/snake/.stack-work/install/x86_64-osx/ee8de4db07d0fc4409a373398073937d76c8a58b2966e2e04da3ed97dfa7146d/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "snake_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "snake_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "snake_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "snake_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "snake_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "snake_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
