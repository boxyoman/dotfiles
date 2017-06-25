{-# LANGUAGE TemplateHaskell #-}
module Neovim.Example.Plugin.Random
    ( nextRandom
    , setNextRandom
    , randomNumbers
    ) where

import Neovim
import System.Random (newStdGen, randoms)

-- | This is the start up code. It initializes the random number generator and
-- returns a convenient list of random numbers.
--
-- Except for the last @[Int16]@ return values, this type signature is mandatory
-- for your startup code. The internals of the plugin recompilation leak here a
-- bit, it might be changed in the future. If you don't mind warnings, you can
-- leave the signature undefined, but then you would have to add a type
-- signature to the value of @randoms g@.
--
-- See <https://github.com/neovimhaskell/nvim-hs/issues/13> for details.
--
-- Neovim isn't so good with big numbers, so limit to 16 bits.
randomNumbers :: Neovim (StartupConfig NeovimConfig) () [Int16]
randomNumbers = do
    g <- liftIO newStdGen -- Create a new seed for a pseudo random number generator
    return (randoms g)    -- Return an infinite list of random numbers

-- You could write this shorter in more idiomatic Haskell:
-- randomNumbers = randoms <$> liftIO newStdGen

-- | Get the next random number and update the state of the list.
nextRandom :: Neovim r [Int16] Int16
nextRandom = do
    r <- gets head -- get the head of the infinite random number list
    modify tail    -- set the list to its tail
    return r

-- An alternative equivalent implementation with pattern matching on the list
-- nextRandom :: Neovim r [Int16] Int16
-- nextRandom = do
--     (r:rs) <- get
--     put rs
--     return r

-- | You probably don't want this in a random number generator, but this shows
-- hoy you can edit the state of a stateful plugin.
setNextRandom :: Int16 -> Neovim r [Int16] ()
setNextRandom n = modify (n:) -- cons n to the front of the infinite list
