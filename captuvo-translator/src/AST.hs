module AST where

data Identifier = Identifier {name :: String} deriving (Show, Eq)

-- Enum is Prelude name, so Enumeration
data Enumeration = Enumeration {typename :: Identifier, fields :: [Identifier]} deriving (Show, Eq)
