{-# LANGUAGE TemplateHaskell #-}
-- Template Haskell is used to remove a lot of manual boiler-plate from
-- declaring the functions you want to export.
module Neovim.Example.Plugin
    ( plugin
    ) where

import Neovim

import Neovim.Example.Plugin.Random (nextRandom, setNextRandom, randomNumbers)
import Neovim.Example.Plugin.Fibonacci (fibonacci)

plugin :: Neovim (StartupConfig NeovimConfig) () NeovimPlugin
plugin = do
    randomPluginState <- randomNumbers
    wrapPlugin Plugin
        { exports =
            [ $(function' 'fibonacci) Sync
            -- Notice the quotation mark before the functin name, this is
            -- important!
            ]
        , statefulExports =
            [ StatefulFunctionality
                { readOnly = ()
                , writable = randomPluginState
                , functionalities =
                    [ $(function' 'nextRandom) Sync
                    , $(function "SetNextRandom" 'setNextRandom) Async
                    ]
                }
            ]
        }
