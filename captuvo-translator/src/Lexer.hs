module Lexer where
import qualified Text.Megaparsec.Lexer as L
import Text.Megaparsec.Char
import Text.Megaparsec.String
import Text.Megaparsec
import Control.Monad (void)

---- helper functions

spaceSkip :: Parser ()
spaceSkip = skipMany spaceChar

symbol :: String -> Parser String
symbol = L.symbol spaceSkip

skip1 :: String -> Parser ()
skip1 = void . symbol

---- actual lexemes
-- keywords and separators

typedef :: Parser ()
typedef = skip1 "typedef"

enum :: Parser ()
enum = skip1 "enum"

comma :: Parser ()
comma = skip1 ","

semicolon :: Parser ()
semicolon = skip1 ";"

-- combinators

identifier :: Parser String
identifier = (:) <$> letterChar <*> many (alphaNumChar <|> char '_') <* spaceSkip

parens :: Parser a -> Parser a
parens = between (symbol "(") (symbol ")")

brackets :: Parser a -> Parser a
brackets = between (symbol "[") (symbol "]")

braces :: Parser a -> Parser a
braces = between (symbol "{") (symbol "}")

