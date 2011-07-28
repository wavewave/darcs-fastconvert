import Control.Monad ( unless, when, forM_ )
import Darcs.Patch.Show ( showPatch )
import Darcs.Utils ( withCurrentDirectory, promptYorn )
import Printer ( renderString )
    let patchCount = length ps
    putStrLn $ "Successfully parsed " ++ show patchCount ++ " patches."
    forM_ (zip ([1..] :: [Int]) ps) $ \(index, p@(GitPatch _ _ msg _)) -> do
      putStrLn $ unwords
        [ "Applying patch", show index, "of", show patchCount ++ ":"
        , BC.unpack $ head msg]
      applyGitPatch shouldPrompt p
        putStrLn $ "Rolling back after prim failed to apply: "
          ++ renderString (showPatch p)
        die "A prim did not apply, no changes from this patch have been made."
        then promptYorn $ "WARNING: Hash of " ++ fp ++ " does not match patch"
             ++ "\nNo changes will be recorded, if the patch does not apply."
             ++ "\nContinue anyway?"
    (msg : description) <- p_commitMsg
    let commitLog = removePatchHeader msg : description
    return $ GitPatch author date commitLog diffs

  removePatchHeader msg = if BC.pack "[PATCH" `BC.isPrefixOf` msg
    then BC.drop 2 $ BC.dropWhile (/= ']') msg
    else msg
    specialLineDelimited' ls endCase endMod = do
      perhaps <- toEOL
      if perhaps == endCase
        then return . endMod $ ls
        else specialLineDelimited' (perhaps : ls) endCase endMod