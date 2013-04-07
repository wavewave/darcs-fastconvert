import Data.Attoparsec.Combinator( many' )
parseGitEmail h = go (A.parse $ many' p_gitPatch) BC.empty h where
    diffs <- many' p_diff
    many' p_unifiedHunk