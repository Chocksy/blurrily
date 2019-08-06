module Blurrily
  DEFAULT_DATABASE = 'words'

  LIMIT_DEFAULT = 10
  LIMIT_RANGE   = 1..1024
  REF_RANGE     = 1..(1<<31)
  WEIGHT_RANGE  = 0..(1<<31)
end
