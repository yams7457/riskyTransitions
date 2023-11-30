---@diagnostic disable: unreachable-code
m = midi.connect(1)

params:add_number(
    "melodyProb", -- id
    "melody probability", -- name
    0, -- min
    100, -- max
    100, -- default
    false -- wrap
    )

params:add_number(
    "compProb", -- id
    "comp probability", -- name
    0, -- min
    100, -- max
    100, -- default
    false -- wrap
    )

params:add_number(
    "bassProb", -- id
    "bass probability", -- name
    0, -- min
    100, -- max
    100, -- default
    false -- wrap
    )

params:add_number(
    "melodyThreshold", -- id
    "melody threshold", -- name
    0, -- min
    127, -- max
    0, -- default
    false -- wrap
    )

params:add_number(
    "compThreshold", -- id
    "comp threshold", -- name
    0, -- min
    127, -- max
    0, -- default
    false -- wrap
    )

params:add_number(
    "bassThreshold", -- id
    "bass threshold", -- name
    0, -- min
    127, -- max
    0, -- default
    false -- wrap
    )

params:add_number(
    "octaveOffset", -- id
    "octave offset", -- name
    0, -- min
    12, -- max
    2, -- default
    false -- wrap
    )


pentadQualities = {

{0, 1, 2, 4, 7},
{0, 1, 4, 7, 10},
{0, 2, 4, 7, 10},
{0, 2, 3, 4, 7},
{0, 3, 4, 7, 10},
{0, 2, 4, 5, 7},
{0, 4, 5, 7, 10},
{0, 2, 4, 6, 7},
{0, 4, 6, 7, 10},
{0, 2, 4, 7, 8},
{0, 4, 7, 8, 10},
{0, 2, 4, 7, 9},
{0, 4, 7, 9, 10},
{0, 2, 4, 7, 11},
{0, 4, 7, 10, 11},
{0, 1, 2, 3, 7},
{0, 2, 3, 7, 10},
{0, 2, 3, 5, 7},
{0, 2, 3, 6, 7},
{0, 3, 6, 7, 10},
{0, 2, 3, 7, 9},
{0, 3, 7, 9, 10},
{0, 2, 3, 7, 11},
{0, 3, 7, 10, 11},
{0, 2, 4, 8, 10},
{0, 1, 2, 3, 6},
{0, 2, 3, 6, 10},
{0, 2, 3, 4, 6},
{0, 3, 4, 6, 10},
{0, 2, 3, 5, 6},
{0, 3, 6, 9, 10},
{0, 2, 4, 9, 10},
{0, 2, 6, 7, 10},
{0, 4, 6, 10, 11}
  }

allTetrads = {


    {0, 1, 4, 7}, {1, 2, 5, 8}, {2, 3, 6, 9}, {3, 4, 7, 10}, {4, 5, 8, 11}, {0, 5, 6, 9}, {1, 6, 7, 10}, {2, 7, 8, 11}, {0, 3, 8, 9}, {1, 4, 9, 10}, {2, 5, 10, 11}, {0, 3, 6, 11},
    {0, 3, 6, 11}, {0, 1, 4, 7}, {1, 2, 5, 8}, {2, 3, 6, 9}, {3, 4, 7, 10}, {4, 5, 8, 11}, {0, 5, 6, 9}, {1, 6, 7, 10}, {2, 7, 8, 11}, {0, 3, 8, 9}, {1, 4, 9, 10}, {2, 5, 10, 11},
    {0, 3, 8, 9}, {1, 4, 9, 10}, {2, 5, 10, 11}, {0, 3, 6, 11}, {0, 1, 4, 7}, {1, 2, 5, 8}, {2, 3, 6, 9}, {3, 4, 7, 10}, {4, 5, 8, 11}, {0, 5, 6, 9}, {1, 6, 7, 10}, {2, 7, 8, 11},
    {0, 5, 6, 9}, {1, 6, 7, 10}, {2, 7, 8, 11}, {0, 3, 8, 9}, {1, 4, 9, 10}, {2, 5, 10, 11}, {0, 3, 6, 11}, {0, 1, 4, 7}, {1, 2, 5, 8}, {2, 3, 6, 9}, {3, 4, 7, 10}, {4, 5, 8, 11},
    {0, 2, 4, 7}, {1, 3, 5, 8}, {2, 4, 6, 9}, {3, 5, 7, 10}, {4, 6, 8, 11}, {0, 5, 7, 9}, {1, 6, 8, 10}, {2, 7, 9, 11}, {0, 3, 8, 10}, {1, 4, 9, 11}, {0, 2, 5, 10}, {1, 3, 6, 11},
    {0, 2, 5, 10}, {1, 3, 6, 11}, {0, 2, 4, 7}, {1, 3, 5, 8}, {2, 4, 6, 9}, {3, 5, 7, 10}, {4, 6, 8, 11}, {0, 5, 7, 9}, {1, 6, 8, 10}, {2, 7, 9, 11}, {0, 3, 8, 10}, {1, 4, 9, 11},
    {0, 3, 8, 10}, {1, 4, 9, 11}, {0, 2, 5, 10}, {1, 3, 6, 11}, {0, 2, 4, 7}, {1, 3, 5, 8}, {2, 4, 6, 9}, {3, 5, 7, 10}, {4, 6, 8, 11}, {0, 5, 7, 9}, {1, 6, 8, 10}, {2, 7, 9, 11},
    {0, 5, 7, 9}, {1, 6, 8, 10}, {2, 7, 9, 11}, {0, 3, 8, 10}, {1, 4, 9, 11}, {0, 2, 5, 10}, {1, 3, 6, 11}, {0, 2, 4, 7}, {1, 3, 5, 8}, {2, 4, 6, 9}, {3, 5, 7, 10}, {4, 6, 8, 11},
    {0, 3, 4, 7}, {1, 4, 5, 8}, {2, 5, 6, 9}, {3, 6, 7, 10}, {4, 7, 8, 11}, {0, 5, 8, 9}, {1, 6, 9, 10}, {2, 7, 10, 11}, {0, 3, 8, 11}, {0, 1, 4, 9}, {1, 2, 5, 10}, {2, 3, 6, 11},
    {0, 1, 4, 9}, {1, 2, 5, 10}, {2, 3, 6, 11}, {0, 3, 4, 7}, {1, 4, 5, 8}, {2, 5, 6, 9}, {3, 6, 7, 10}, {4, 7, 8, 11}, {0, 5, 8, 9}, {1, 6, 9, 10}, {2, 7, 10, 11}, {0, 3, 8, 11},
    {0, 3, 8, 11}, {0, 1, 4, 9}, {1, 2, 5, 10}, {2, 3, 6, 11}, {0, 3, 4, 7}, {1, 4, 5, 8}, {2, 5, 6, 9}, {3, 6, 7, 10}, {4, 7, 8, 11}, {0, 5, 8, 9}, {1, 6, 9, 10}, {2, 7, 10, 11},
    {0, 5, 8, 9}, {1, 6, 9, 10}, {2, 7, 10, 11}, {0, 3, 8, 11}, {0, 1, 4, 9}, {1, 2, 5, 10}, {2, 3, 6, 11}, {0, 3, 4, 7}, {1, 4, 5, 8}, {2, 5, 6, 9}, {3, 6, 7, 10}, {4, 7, 8, 11},
    {0, 4, 5, 7}, {1, 5, 6, 8}, {2, 6, 7, 9}, {3, 7, 8, 10}, {4, 8, 9, 11}, {0, 5, 9, 10}, {1, 6, 10, 11}, {0, 2, 7, 11}, {0, 1, 3, 8}, {1, 2, 4, 9}, {2, 3, 5, 10}, {3, 4, 6, 11},
    {0, 1, 3, 8}, {1, 2, 4, 9}, {2, 3, 5, 10}, {3, 4, 6, 11}, {0, 4, 5, 7}, {1, 5, 6, 8}, {2, 6, 7, 9}, {3, 7, 8, 10}, {4, 8, 9, 11}, {0, 5, 9, 10}, {1, 6, 10, 11}, {0, 2, 7, 11},
    {0, 2, 7, 11}, {0, 1, 3, 8}, {1, 2, 4, 9}, {2, 3, 5, 10}, {3, 4, 6, 11}, {0, 4, 5, 7}, {1, 5, 6, 8}, {2, 6, 7, 9}, {3, 7, 8, 10}, {4, 8, 9, 11}, {0, 5, 9, 10}, {1, 6, 10, 11},
    {0, 5, 9, 10}, {1, 6, 10, 11}, {0, 2, 7, 11}, {0, 1, 3, 8}, {1, 2, 4, 9}, {2, 3, 5, 10}, {3, 4, 6, 11}, {0, 4, 5, 7}, {1, 5, 6, 8}, {2, 6, 7, 9}, {3, 7, 8, 10}, {4, 8, 9, 11},
    {0, 4, 6, 7}, {1, 5, 7, 8}, {2, 6, 8, 9}, {3, 7, 9, 10}, {4, 8, 10, 11}, {0, 5, 9, 11}, {0, 1, 6, 10}, {1, 2, 7, 11}, {0, 2, 3, 8}, {1, 3, 4, 9}, {2, 4, 5, 10}, {3, 5, 6, 11},
    {0, 2, 3, 8}, {1, 3, 4, 9}, {2, 4, 5, 10}, {3, 5, 6, 11}, {0, 4, 6, 7}, {1, 5, 7, 8}, {2, 6, 8, 9}, {3, 7, 9, 10}, {4, 8, 10, 11}, {0, 5, 9, 11}, {0, 1, 6, 10}, {1, 2, 7, 11},
    {0, 1, 6, 10}, {1, 2, 7, 11}, {0, 2, 3, 8}, {1, 3, 4, 9}, {2, 4, 5, 10}, {3, 5, 6, 11}, {0, 4, 6, 7}, {1, 5, 7, 8}, {2, 6, 8, 9}, {3, 7, 9, 10}, {4, 8, 10, 11}, {0, 5, 9, 11},
    {0, 5, 9, 11}, {0, 1, 6, 10}, {1, 2, 7, 11}, {0, 2, 3, 8}, {1, 3, 4, 9}, {2, 4, 5, 10}, {3, 5, 6, 11}, {0, 4, 6, 7}, {1, 5, 7, 8}, {2, 6, 8, 9}, {3, 7, 9, 10}, {4, 8, 10, 11},
    {0, 4, 7, 8}, {1, 5, 8, 9}, {2, 6, 9, 10}, {3, 7, 10, 11}, {0, 4, 8, 11}, {0, 1, 5, 9}, {1, 2, 6, 10}, {2, 3, 7, 11}, {0, 3, 4, 8}, {1, 4, 5, 9}, {2, 5, 6, 10}, {3, 6, 7, 11},
    {0, 3, 4, 8}, {1, 4, 5, 9}, {2, 5, 6, 10}, {3, 6, 7, 11}, {0, 4, 7, 8}, {1, 5, 8, 9}, {2, 6, 9, 10}, {3, 7, 10, 11}, {0, 4, 8, 11}, {0, 1, 5, 9}, {1, 2, 6, 10}, {2, 3, 7, 11},
    {0, 1, 5, 9}, {1, 2, 6, 10}, {2, 3, 7, 11}, {0, 3, 4, 8}, {1, 4, 5, 9}, {2, 5, 6, 10}, {3, 6, 7, 11}, {0, 4, 7, 8}, {1, 5, 8, 9}, {2, 6, 9, 10}, {3, 7, 10, 11}, {0, 4, 8, 11},
    {0, 4, 8, 11}, {0, 1, 5, 9}, {1, 2, 6, 10}, {2, 3, 7, 11}, {0, 3, 4, 8}, {1, 4, 5, 9}, {2, 5, 6, 10}, {3, 6, 7, 11}, {0, 4, 7, 8}, {1, 5, 8, 9}, {2, 6, 9, 10}, {3, 7, 10, 11},
    {0, 4, 7, 9}, {1, 5, 8, 10}, {2, 6, 9, 11}, {0, 3, 7, 10}, {1, 4, 8, 11}, {0, 2, 5, 9}, {1, 3, 6, 10}, {2, 4, 7, 11}, {0, 3, 5, 8}, {1, 4, 6, 9}, {2, 5, 7, 10}, {3, 6, 8, 11},
    {0, 3, 5, 8}, {1, 4, 6, 9}, {2, 5, 7, 10}, {3, 6, 8, 11}, {0, 4, 7, 9}, {1, 5, 8, 10}, {2, 6, 9, 11}, {0, 3, 7, 10}, {1, 4, 8, 11}, {0, 2, 5, 9}, {1, 3, 6, 10}, {2, 4, 7, 11},
    {0, 2, 5, 9}, {1, 3, 6, 10}, {2, 4, 7, 11}, {0, 3, 5, 8}, {1, 4, 6, 9}, {2, 5, 7, 10}, {3, 6, 8, 11}, {0, 4, 7, 9}, {1, 5, 8, 10}, {2, 6, 9, 11}, {0, 3, 7, 10}, {1, 4, 8, 11},
    {0, 3, 7, 10}, {1, 4, 8, 11}, {0, 2, 5, 9}, {1, 3, 6, 10}, {2, 4, 7, 11}, {0, 3, 5, 8}, {1, 4, 6, 9}, {2, 5, 7, 10}, {3, 6, 8, 11}, {0, 4, 7, 9}, {1, 5, 8, 10}, {2, 6, 9, 11},
    {0, 4, 7, 10}, {1, 5, 8, 11}, {0, 2, 6, 9}, {1, 3, 7, 10}, {2, 4, 8, 11}, {0, 3, 5, 9}, {1, 4, 6, 10}, {2, 5, 7, 11}, {0, 3, 6, 8}, {1, 4, 7, 9}, {2, 5, 8, 10}, {3, 6, 9, 11},
    {0, 3, 6, 8}, {1, 4, 7, 9}, {2, 5, 8, 10}, {3, 6, 9, 11}, {0, 4, 7, 10}, {1, 5, 8, 11}, {0, 2, 6, 9}, {1, 3, 7, 10}, {2, 4, 8, 11}, {0, 3, 5, 9}, {1, 4, 6, 10}, {2, 5, 7, 11},
    {0, 3, 5, 9}, {1, 4, 6, 10}, {2, 5, 7, 11}, {0, 3, 6, 8}, {1, 4, 7, 9}, {2, 5, 8, 10}, {3, 6, 9, 11}, {0, 4, 7, 10}, {1, 5, 8, 11}, {0, 2, 6, 9}, {1, 3, 7, 10}, {2, 4, 8, 11},
    {0, 2, 6, 9}, {1, 3, 7, 10}, {2, 4, 8, 11}, {0, 3, 5, 9}, {1, 4, 6, 10}, {2, 5, 7, 11}, {0, 3, 6, 8}, {1, 4, 7, 9}, {2, 5, 8, 10}, {3, 6, 9, 11}, {0, 4, 7, 10}, {1, 5, 8, 11},
    {0, 4, 7, 11}, {0, 1, 5, 8}, {1, 2, 6, 9}, {2, 3, 7, 10}, {3, 4, 8, 11}, {0, 4, 5, 9}, {1, 5, 6, 10}, {2, 6, 7, 11}, {0, 3, 7, 8}, {1, 4, 8, 9}, {2, 5, 9, 10}, {3, 6, 10, 11},
    {0, 3, 7, 8}, {1, 4, 8, 9}, {2, 5, 9, 10}, {3, 6, 10, 11}, {0, 4, 7, 11}, {0, 1, 5, 8}, {1, 2, 6, 9}, {2, 3, 7, 10}, {3, 4, 8, 11}, {0, 4, 5, 9}, {1, 5, 6, 10}, {2, 6, 7, 11},
    {0, 4, 5, 9}, {1, 5, 6, 10}, {2, 6, 7, 11}, {0, 3, 7, 8}, {1, 4, 8, 9}, {2, 5, 9, 10}, {3, 6, 10, 11}, {0, 4, 7, 11}, {0, 1, 5, 8}, {1, 2, 6, 9}, {2, 3, 7, 10}, {3, 4, 8, 11},
    {0, 1, 5, 8}, {1, 2, 6, 9}, {2, 3, 7, 10}, {3, 4, 8, 11}, {0, 4, 5, 9}, {1, 5, 6, 10}, {2, 6, 7, 11}, {0, 3, 7, 8}, {1, 4, 8, 9}, {2, 5, 9, 10}, {3, 6, 10, 11}, {0, 4, 7, 11},
    {0, 1, 3, 7}, {1, 2, 4, 8}, {2, 3, 5, 9}, {3, 4, 6, 10}, {4, 5, 7, 11}, {0, 5, 6, 8}, {1, 6, 7, 9}, {2, 7, 8, 10}, {3, 8, 9, 11}, {0, 4, 9, 10}, {1, 5, 10, 11}, {0, 2, 6, 11},
    {0, 2, 6, 11}, {0, 1, 3, 7}, {1, 2, 4, 8}, {2, 3, 5, 9}, {3, 4, 6, 10}, {4, 5, 7, 11}, {0, 5, 6, 8}, {1, 6, 7, 9}, {2, 7, 8, 10}, {3, 8, 9, 11}, {0, 4, 9, 10}, {1, 5, 10, 11},
    {0, 4, 9, 10}, {1, 5, 10, 11}, {0, 2, 6, 11}, {0, 1, 3, 7}, {1, 2, 4, 8}, {2, 3, 5, 9}, {3, 4, 6, 10}, {4, 5, 7, 11}, {0, 5, 6, 8}, {1, 6, 7, 9}, {2, 7, 8, 10}, {3, 8, 9, 11},
    {0, 5, 6, 8}, {1, 6, 7, 9}, {2, 7, 8, 10}, {3, 8, 9, 11}, {0, 4, 9, 10}, {1, 5, 10, 11}, {0, 2, 6, 11}, {0, 1, 3, 7}, {1, 2, 4, 8}, {2, 3, 5, 9}, {3, 4, 6, 10}, {4, 5, 7, 11},
    {0, 2, 3, 7}, {1, 3, 4, 8}, {2, 4, 5, 9}, {3, 5, 6, 10}, {4, 6, 7, 11}, {0, 5, 7, 8}, {1, 6, 8, 9}, {2, 7, 9, 10}, {3, 8, 10, 11}, {0, 4, 9, 11}, {0, 1, 5, 10}, {1, 2, 6, 11},
    {0, 1, 5, 10}, {1, 2, 6, 11}, {0, 2, 3, 7}, {1, 3, 4, 8}, {2, 4, 5, 9}, {3, 5, 6, 10}, {4, 6, 7, 11}, {0, 5, 7, 8}, {1, 6, 8, 9}, {2, 7, 9, 10}, {3, 8, 10, 11}, {0, 4, 9, 11},
    {0, 4, 9, 11}, {0, 1, 5, 10}, {1, 2, 6, 11}, {0, 2, 3, 7}, {1, 3, 4, 8}, {2, 4, 5, 9}, {3, 5, 6, 10}, {4, 6, 7, 11}, {0, 5, 7, 8}, {1, 6, 8, 9}, {2, 7, 9, 10}, {3, 8, 10, 11},
    {0, 5, 7, 8}, {1, 6, 8, 9}, {2, 7, 9, 10}, {3, 8, 10, 11}, {0, 4, 9, 11}, {0, 1, 5, 10}, {1, 2, 6, 11}, {0, 2, 3, 7}, {1, 3, 4, 8}, {2, 4, 5, 9}, {3, 5, 6, 10}, {4, 6, 7, 11},
    {0, 3, 5, 7}, {1, 4, 6, 8}, {2, 5, 7, 9}, {3, 6, 8, 10}, {4, 7, 9, 11}, {0, 5, 8, 10}, {1, 6, 9, 11}, {0, 2, 7, 10}, {1, 3, 8, 11}, {0, 2, 4, 9}, {1, 3, 5, 10}, {2, 4, 6, 11},
    {0, 2, 4, 9}, {1, 3, 5, 10}, {2, 4, 6, 11}, {0, 3, 5, 7}, {1, 4, 6, 8}, {2, 5, 7, 9}, {3, 6, 8, 10}, {4, 7, 9, 11}, {0, 5, 8, 10}, {1, 6, 9, 11}, {0, 2, 7, 10}, {1, 3, 8, 11},
    {0, 2, 7, 10}, {1, 3, 8, 11}, {0, 2, 4, 9}, {1, 3, 5, 10}, {2, 4, 6, 11}, {0, 3, 5, 7}, {1, 4, 6, 8}, {2, 5, 7, 9}, {3, 6, 8, 10}, {4, 7, 9, 11}, {0, 5, 8, 10}, {1, 6, 9, 11},
    {0, 5, 8, 10}, {1, 6, 9, 11}, {0, 2, 7, 10}, {1, 3, 8, 11}, {0, 2, 4, 9}, {1, 3, 5, 10}, {2, 4, 6, 11}, {0, 3, 5, 7}, {1, 4, 6, 8}, {2, 5, 7, 9}, {3, 6, 8, 10}, {4, 7, 9, 11},
    {0, 3, 6, 7}, {1, 4, 7, 8}, {2, 5, 8, 9}, {3, 6, 9, 10}, {4, 7, 10, 11}, {0, 5, 8, 11}, {0, 1, 6, 9}, {1, 2, 7, 10}, {2, 3, 8, 11}, {0, 3, 4, 9}, {1, 4, 5, 10}, {2, 5, 6, 11},
    {0, 3, 4, 9}, {1, 4, 5, 10}, {2, 5, 6, 11}, {0, 3, 6, 7}, {1, 4, 7, 8}, {2, 5, 8, 9}, {3, 6, 9, 10}, {4, 7, 10, 11}, {0, 5, 8, 11}, {0, 1, 6, 9}, {1, 2, 7, 10}, {2, 3, 8, 11},
    {0, 1, 6, 9}, {1, 2, 7, 10}, {2, 3, 8, 11}, {0, 3, 4, 9}, {1, 4, 5, 10}, {2, 5, 6, 11}, {0, 3, 6, 7}, {1, 4, 7, 8}, {2, 5, 8, 9}, {3, 6, 9, 10}, {4, 7, 10, 11}, {0, 5, 8, 11},
    {0, 5, 8, 11}, {0, 1, 6, 9}, {1, 2, 7, 10}, {2, 3, 8, 11}, {0, 3, 4, 9}, {1, 4, 5, 10}, {2, 5, 6, 11}, {0, 3, 6, 7}, {1, 4, 7, 8}, {2, 5, 8, 9}, {3, 6, 9, 10}, {4, 7, 10, 11},
    {0, 3, 7, 9}, {1, 4, 8, 10}, {2, 5, 9, 11}, {0, 3, 6, 10}, {1, 4, 7, 11}, {0, 2, 5, 8}, {1, 3, 6, 9}, {2, 4, 7, 10}, {3, 5, 8, 11}, {0, 4, 6, 9}, {1, 5, 7, 10}, {2, 6, 8, 11},
    {0, 4, 6, 9}, {1, 5, 7, 10}, {2, 6, 8, 11}, {0, 3, 7, 9}, {1, 4, 8, 10}, {2, 5, 9, 11}, {0, 3, 6, 10}, {1, 4, 7, 11}, {0, 2, 5, 8}, {1, 3, 6, 9}, {2, 4, 7, 10}, {3, 5, 8, 11},
    {0, 2, 5, 8}, {1, 3, 6, 9}, {2, 4, 7, 10}, {3, 5, 8, 11}, {0, 4, 6, 9}, {1, 5, 7, 10}, {2, 6, 8, 11}, {0, 3, 7, 9}, {1, 4, 8, 10}, {2, 5, 9, 11}, {0, 3, 6, 10}, {1, 4, 7, 11},
    {0, 3, 6, 10}, {1, 4, 7, 11}, {0, 2, 5, 8}, {1, 3, 6, 9}, {2, 4, 7, 10}, {3, 5, 8, 11}, {0, 4, 6, 9}, {1, 5, 7, 10}, {2, 6, 8, 11}, {0, 3, 7, 9}, {1, 4, 8, 10}, {2, 5, 9, 11},
    {0, 3, 7, 11}, {0, 1, 4, 8}, {1, 2, 5, 9}, {2, 3, 6, 10}, {3, 4, 7, 11}, {0, 4, 5, 8}, {1, 5, 6, 9}, {2, 6, 7, 10}, {3, 7, 8, 11}, {0, 4, 8, 9}, {1, 5, 9, 10}, {2, 6, 10, 11},
    {0, 4, 8, 9}, {1, 5, 9, 10}, {2, 6, 10, 11}, {0, 3, 7, 11}, {0, 1, 4, 8}, {1, 2, 5, 9}, {2, 3, 6, 10}, {3, 4, 7, 11}, {0, 4, 5, 8}, {1, 5, 6, 9}, {2, 6, 7, 10}, {3, 7, 8, 11},
    {0, 4, 5, 8}, {1, 5, 6, 9}, {2, 6, 7, 10}, {3, 7, 8, 11}, {0, 4, 8, 9}, {1, 5, 9, 10}, {2, 6, 10, 11}, {0, 3, 7, 11}, {0, 1, 4, 8}, {1, 2, 5, 9}, {2, 3, 6, 10}, {3, 4, 7, 11},
    {0, 1, 4, 8}, {1, 2, 5, 9}, {2, 3, 6, 10}, {3, 4, 7, 11}, {0, 4, 5, 8}, {1, 5, 6, 9}, {2, 6, 7, 10}, {3, 7, 8, 11}, {0, 4, 8, 9}, {1, 5, 9, 10}, {2, 6, 10, 11}, {0, 3, 7, 11},
    {0, 2, 4, 8}, {1, 3, 5, 9}, {2, 4, 6, 10}, {3, 5, 7, 11}, {0, 4, 6, 8}, {1, 5, 7, 9}, {2, 6, 8, 10}, {3, 7, 9, 11}, {0, 4, 8, 10}, {1, 5, 9, 11}, {0, 2, 6, 10}, {1, 3, 7, 11},
    {0, 2, 6, 10}, {1, 3, 7, 11}, {0, 2, 4, 8}, {1, 3, 5, 9}, {2, 4, 6, 10}, {3, 5, 7, 11}, {0, 4, 6, 8}, {1, 5, 7, 9}, {2, 6, 8, 10}, {3, 7, 9, 11}, {0, 4, 8, 10}, {1, 5, 9, 11},
    {0, 4, 8, 10}, {1, 5, 9, 11}, {0, 2, 6, 10}, {1, 3, 7, 11}, {0, 2, 4, 8}, {1, 3, 5, 9}, {2, 4, 6, 10}, {3, 5, 7, 11}, {0, 4, 6, 8}, {1, 5, 7, 9}, {2, 6, 8, 10}, {3, 7, 9, 11},
    {0, 4, 6, 8}, {1, 5, 7, 9}, {2, 6, 8, 10}, {3, 7, 9, 11}, {0, 4, 8, 10}, {1, 5, 9, 11}, {0, 2, 6, 10}, {1, 3, 7, 11}, {0, 2, 4, 8}, {1, 3, 5, 9}, {2, 4, 6, 10}, {3, 5, 7, 11},
    {0, 1, 3, 6}, {1, 2, 4, 7}, {2, 3, 5, 8}, {3, 4, 6, 9}, {4, 5, 7, 10}, {5, 6, 8, 11}, {0, 6, 7, 9}, {1, 7, 8, 10}, {2, 8, 9, 11}, {0, 3, 9, 10}, {1, 4, 10, 11}, {0, 2, 5, 11},
    {0, 2, 5, 11}, {0, 1, 3, 6}, {1, 2, 4, 7}, {2, 3, 5, 8}, {3, 4, 6, 9}, {4, 5, 7, 10}, {5, 6, 8, 11}, {0, 6, 7, 9}, {1, 7, 8, 10}, {2, 8, 9, 11}, {0, 3, 9, 10}, {1, 4, 10, 11},
    {0, 3, 9, 10}, {1, 4, 10, 11}, {0, 2, 5, 11}, {0, 1, 3, 6}, {1, 2, 4, 7}, {2, 3, 5, 8}, {3, 4, 6, 9}, {4, 5, 7, 10}, {5, 6, 8, 11}, {0, 6, 7, 9}, {1, 7, 8, 10}, {2, 8, 9, 11},
    {0, 6, 7, 9}, {1, 7, 8, 10}, {2, 8, 9, 11}, {0, 3, 9, 10}, {1, 4, 10, 11}, {0, 2, 5, 11}, {0, 1, 3, 6}, {1, 2, 4, 7}, {2, 3, 5, 8}, {3, 4, 6, 9}, {4, 5, 7, 10}, {5, 6, 8, 11},
    {0, 2, 3, 6}, {1, 3, 4, 7}, {2, 4, 5, 8}, {3, 5, 6, 9}, {4, 6, 7, 10}, {5, 7, 8, 11}, {0, 6, 8, 9}, {1, 7, 9, 10}, {2, 8, 10, 11}, {0, 3, 9, 11}, {0, 1, 4, 10}, {1, 2, 5, 11},
    {0, 1, 4, 10}, {1, 2, 5, 11}, {0, 2, 3, 6}, {1, 3, 4, 7}, {2, 4, 5, 8}, {3, 5, 6, 9}, {4, 6, 7, 10}, {5, 7, 8, 11}, {0, 6, 8, 9}, {1, 7, 9, 10}, {2, 8, 10, 11}, {0, 3, 9, 11},
    {0, 3, 9, 11}, {0, 1, 4, 10}, {1, 2, 5, 11}, {0, 2, 3, 6}, {1, 3, 4, 7}, {2, 4, 5, 8}, {3, 5, 6, 9}, {4, 6, 7, 10}, {5, 7, 8, 11}, {0, 6, 8, 9}, {1, 7, 9, 10}, {2, 8, 10, 11},
    {0, 6, 8, 9}, {1, 7, 9, 10}, {2, 8, 10, 11}, {0, 3, 9, 11}, {0, 1, 4, 10}, {1, 2, 5, 11}, {0, 2, 3, 6}, {1, 3, 4, 7}, {2, 4, 5, 8}, {3, 5, 6, 9}, {4, 6, 7, 10}, {5, 7, 8, 11},
    {0, 3, 4, 6}, {1, 4, 5, 7}, {2, 5, 6, 8}, {3, 6, 7, 9}, {4, 7, 8, 10}, {5, 8, 9, 11}, {0, 6, 9, 10}, {1, 7, 10, 11}, {0, 2, 8, 11}, {0, 1, 3, 9}, {1, 2, 4, 10}, {2, 3, 5, 11},
    {0, 1, 3, 9}, {1, 2, 4, 10}, {2, 3, 5, 11}, {0, 3, 4, 6}, {1, 4, 5, 7}, {2, 5, 6, 8}, {3, 6, 7, 9}, {4, 7, 8, 10}, {5, 8, 9, 11}, {0, 6, 9, 10}, {1, 7, 10, 11}, {0, 2, 8, 11},
    {0, 2, 8, 11}, {0, 1, 3, 9}, {1, 2, 4, 10}, {2, 3, 5, 11}, {0, 3, 4, 6}, {1, 4, 5, 7}, {2, 5, 6, 8}, {3, 6, 7, 9}, {4, 7, 8, 10}, {5, 8, 9, 11}, {0, 6, 9, 10}, {1, 7, 10, 11},
    {0, 6, 9, 10}, {1, 7, 10, 11}, {0, 2, 8, 11}, {0, 1, 3, 9}, {1, 2, 4, 10}, {2, 3, 5, 11}, {0, 3, 4, 6}, {1, 4, 5, 7}, {2, 5, 6, 8}, {3, 6, 7, 9}, {4, 7, 8, 10}, {5, 8, 9, 11},
    {0, 3, 5, 6}, {1, 4, 6, 7}, {2, 5, 7, 8}, {3, 6, 8, 9}, {4, 7, 9, 10}, {5, 8, 10, 11}, {0, 6, 9, 11}, {0, 1, 7, 10}, {1, 2, 8, 11}, {0, 2, 3, 9}, {1, 3, 4, 10}, {2, 4, 5, 11},
    {0, 2, 3, 9}, {1, 3, 4, 10}, {2, 4, 5, 11}, {0, 3, 5, 6}, {1, 4, 6, 7}, {2, 5, 7, 8}, {3, 6, 8, 9}, {4, 7, 9, 10}, {5, 8, 10, 11}, {0, 6, 9, 11}, {0, 1, 7, 10}, {1, 2, 8, 11},
    {0, 1, 7, 10}, {1, 2, 8, 11}, {0, 2, 3, 9}, {1, 3, 4, 10}, {2, 4, 5, 11}, {0, 3, 5, 6}, {1, 4, 6, 7}, {2, 5, 7, 8}, {3, 6, 8, 9}, {4, 7, 9, 10}, {5, 8, 10, 11}, {0, 6, 9, 11},
    {0, 6, 9, 11}, {0, 1, 7, 10}, {1, 2, 8, 11}, {0, 2, 3, 9}, {1, 3, 4, 10}, {2, 4, 5, 11}, {0, 3, 5, 6}, {1, 4, 6, 7}, {2, 5, 7, 8}, {3, 6, 8, 9}, {4, 7, 9, 10}, {5, 8, 10, 11},
    {0, 3, 6, 9}, {1, 4, 7, 10}, {2, 5, 8, 11}, {0, 3, 6, 9}, {1, 4, 7, 10}, {2, 5, 8, 11}, {0, 3, 6, 9}, {1, 4, 7, 10}, {2, 5, 8, 11}, {0, 3, 6, 9}, {1, 4, 7, 10}, {2, 5, 8, 11}
}

compDown = {-2,-3,-4,-7}
lastMelodyIndex = math.random(8,25)
sequence = {}
lastBassPitch = math.random(0,11)
pivotFlag = 0
bassFlag = 0

function qualitiesToRoots()
    pentads = {}
    for i = 1, #pentadQualities do
        for j = 0,11 do
            table.insert(pentads, {(pentadQualities[i][1] + j) % 12, (pentadQualities[i][2] + j) % 12, (pentadQualities[i][3] + j) % 12, (pentadQualities[i][4] + j) % 12, (pentadQualities[i][5] + j) % 12})
            for i = 1,20 do pentads[#pentads][i + 5] = pentads[#pentads][i] + 12 end
            table.sort(pentads[#pentads])
        end
    end
end

function initialPentad()
    currentPentad = math.random(1,408)
end

function makeBassCollection()
    local bassCollectionWorking = {}
    for i = 1,5 do
        bassCollectionWorking[i] = (pentads[currentPentad][i] + 12) % 12
        bassCollectionWorking[i + 5] = (pentads[currentPentad][i] + 9) % 12
        bassCollectionWorking[i + 10] = (pentads[currentPentad][i] + 5) % 12
    end
    table.sort(bassCollectionWorking)

    bassCollectionNoDuplicates = removeDuplicates(bassCollectionWorking)
    
end

-- Function to remove duplicates
function removeDuplicates(tbl)
    local unique = {}
    local result = {}

    for _, v in ipairs(tbl) do
        if not unique[v] then
            unique[v] = true
            table.insert(result, v)
        end
    end

    return result
end

function noFlatNine()
    local toBeRemoved = {}
    bassCollection = {}

    -- Step 1 & 2: Iterate through pentads[currentPentad] and mark values in bassCollectionNoDuplicates
    for _, pentadValue in ipairs(pentads[currentPentad]) do
        for _, bassValue in ipairs(bassCollectionNoDuplicates) do
            if bassValue == pentadValue - 1 then
                toBeRemoved[bassValue] = true
            end
        end
    end

    -- Step 3: Create a new table without the values to be removed
    for _, bassValue in ipairs(bassCollectionNoDuplicates) do
        if not toBeRemoved[bassValue] then
            table.insert(bassCollection, bassValue)
        end
    end

    -- Step 4: Return the updated bassCollection
    return bassCollection
end

function randomComp()
        local compNote
        repeat
            compNote = pentads[currentPentad][lastMelodyIndex + compDown[math.random(1,4)]]
        until compNote ~= lastCompNote
      lastCompNote = compNote % 12
      playNote(compNote, math.random(90,120), 2)
end

function randomBass()
    if bassFlag == 1 then
        makeBassCollection()
        bassFlag = 0
    end
    local pitch = bassCollection[math.random(1, #bassCollection)] - 12
    playNote(pitch, math.random(90,120), 3)
    lastBassPitch = pitch % 12
end

function melodyNote()

    -- if pivotFlag == 0 then 

        if lastMelodyIndex < 8 or lastMelodyIndex > 25 then
           error("Input value must be between 8 and 25")
        end

     -- Calculate potential lower and upper bounds
    local lowerBound = math.max(lastMelodyIndex - 4, 8)
    local upperBound = math.min(lastMelodyIndex + 4, 25)

    -- Generate a random value within the bounds
    -- Assuming we want a random integer within the range
    local melodyIndex = math.random(lowerBound, upperBound)
    -- while melodyIndex == lastMelodyIndex do melodyIndex = math.random(lowerBound, upperBound) end

    local pitch = pentads[currentPentad][melodyIndex]
    local vel = math.random(90, 120)
    playNote(pitch, vel, 1)
    print('should be playing ' ..pitch)

    appendNoteToSequence(pitch % 12, sequence)
    
    lastMelodyPitch = pitch
    lastMelodyIndex = melodyIndex

    -- elseif pivotFlag == 1 then
    --     while lastMelodyPitch - pivot >= 12 do pivot = pivot + 12 end
    --     playNote(pivot, math.random(90,120), 1)
    --     for i = 1,3 do
    --         m:cc(123, 0, i)
    --     end
    --     pivotFlag = 0
    -- end
end


function appendNoteToSequence(value, list)
    -- Check if the value is already in the table
    local is_duplicate = false
    for _, v in ipairs(list) do
        if v == value then
            is_duplicate = true
            break
        end
    end
    
    -- Append the new value if it's not a duplicate
    if not is_duplicate then
        list[#list + 1] = value
    
        -- Ensure the table has no more than four values
        while #list > 3 do
            -- Remove the oldest value
            table.remove(list, 1)
        end
    end
end

function playNote(pitch, vel, ch)
    if ch == 3 then
        m:cc(123, 0, ch)
    end
    m:note_on(pitch + params:get("octaveOffset") * 12,vel,ch)
end

m.event = function(data)
    local d = midi.to_msg(data)
    if d.type == "note_on" and d.ch == 16 then
        pollForNotes(d.vel, d.note)
    elseif d.type == "note_on" and d.ch == 15 then
        findTable()
    end

end

function pollForNotes(vel, pitch)
    if math.random(1,100) <= params:get("melodyProb") and vel >= params:get("melodyThreshold") and math.floor(pitch / 12) == 7 then
        melodyNote()
    end
    if math.random(1,100) <= params:get("compProb") and vel >= params:get("compThreshold") and math.floor(pitch / 12) == 6 then
        randomComp()
    end
    if math.random(1,100) <= params:get("bassProb") and vel >= params:get("bassThreshold") and math.floor(pitch / 12) == 5 then
        randomBass()
    end
end
  
math.randomseed(os.time()) -- For random number generation

math.randomseed(os.time()) -- For random number generation

function findTable()
    local suitableTetrads = {}
    local suitablePentads = {}

    -- Find all suitable tables in allTetrads
    for i, tetrad in ipairs(allTetrads) do
        if tableContainsAll(tetrad, sequence) then
            table.insert(suitableTetrads, tetrad)
        end
    end

    -- Randomly select one suitable tetrad
    local selectedTetrad = suitableTetrads[math.random(#suitableTetrads)]
    
    -- Find the pivot
    for _, value in ipairs(selectedTetrad) do
        if not tableContains(sequence, value) then
            pivot = value
            break
        end
    end

    -- Find all suitable tables in pentads
    for i, pentad in ipairs(pentads) do
        if tableContainsAll(pentad, selectedTetrad, 5) then
            local commonNotes = countCommonNotes(pentad, pentads[currentPentad], 5)
            if commonNotes <= 4 then
                table.insert(suitablePentads, {index = i, pentad = pentad})
            end
        end
    end

    -- Check if there are any suitable pentads
    if #suitablePentads > 0 then
        -- Randomly select one suitable pentad
        local selectedPentad = suitablePentads[math.random(#suitablePentads)]
        currentPentad = selectedPentad.index
        return pivot, currentPentad
    else
        -- Handle the case where no suitable pentads are found
        print("No suitable pentads found")
        -- Return nil or handle this case appropriately
        return nil, currentPentad
    end
    pivotFlag = 0
    bassFlag = 1
end

function tableContains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

function tableContainsAll(table, values, limit)
    for _, value in ipairs(values) do
        if not tableContains(table, value, limit) then
            return false
        end
    end
    return true
end

function countCommonNotes(table1, table2, limit)
    local count = 0
    for i = 1, math.min(limit, #table1) do
        for j = 1, math.min(limit, #table2) do
            if table1[i] == table2[j] then
                count = count + 1
                break
            end
        end
    end
    return count
end


function init()
    qualitiesToRoots()
    initialPentad()
    makeBassCollection()
    bassCollection = noFlatNine()
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~loaded up!')
end