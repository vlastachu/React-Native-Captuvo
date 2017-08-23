import Parser
import AST

main :: IO ()
-- TODO testing framework, qouickcheck...
main = do
    print "\ntest enumerations"
    let source = "\n\
        \typedef enum {\n\
        \    HIDActiveLock,\n\
        \    HIDActiveUnlock,\n\
        \    HIDUnactiveLock,\n\
        \    HIDUnactiveUnlock\n\
        \}HIDCurStatus;\
    \"
    let cases = Identifier <$> ["HIDActiveLock", "HIDActiveUnlock", "HIDUnactiveLock", "HIDUnactiveUnlock"]
    let expectation = Enumeration (Identifier "HIDCurStatus") cases
    let Right parsed = testParse enumParser source
    if expectation == parsed then
        print "Success"
    else
        print $ "Failure: `" ++ (show parsed) ++ "` is not `" ++ (show expectation)
