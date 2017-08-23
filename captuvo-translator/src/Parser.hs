module Parser where
import Lexer
import AST
import Text.Megaparsec.String
import Text.Megaparsec

enumParser :: Parser Enumeration
enumParser = do
    typedef
    enum
    cases <- braces (identifier `sepBy` comma)
    enumName <- identifier
    semicolon
    return $ Enumeration (Identifier enumName) (Identifier <$> cases)

testParse :: Parser a -> String -> Either (ParseError (Token String) Dec) a
testParse parser input = parse (spaceSkip >> parser) "test" input
