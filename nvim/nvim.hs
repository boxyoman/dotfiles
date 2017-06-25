import Neovim

import qualified Neovim.Example.Plugin as Example
import qualified Neovim.Ghcid as Ghcid

main :: IO ()
main = do
    neovim defaultConfig
        { plugins = plugins defaultConfig ++
          [ Example.plugin
          , Ghcid.plugin
          ]
        }
