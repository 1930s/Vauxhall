{-# LANGUAGE TemplateHaskell #-}

module Types where
  import qualified Data.Map as M
  import Control.Lens hiding (getConst)

  type Coord = (Int, Int)

  data Item = Potion | Coin | Null deriving Eq
  
  data Direction = Up | Down | Left | Right | Stay deriving Show

  data Action = OpenDoor | CloseDoor | PickUp | DropItem | Rest | ShowInv | ShowStats | Idle | GoDown | GoUp | Quaff | Inspect | Buy | Debug deriving Show

  data Event = Dir Direction | Exit | PlayerAction Action deriving Show
  
  data Effect = Dmg { _eDur :: Int } | None deriving (Show, Eq)

  data Class = Knight {
                _kConst :: Int,
                _kStr :: Int,
                _kDex :: Int,
                _kInt :: Int
               }
               |
               Thief {
                _tConst :: Int,
                _tStr :: Int,
                _tDex :: Int,
                _tInt :: Int
               }
               |
               Sub {
                _sConst :: Int,
                _sStr :: Int,
                _sDex :: Int,
                _sInt :: Int
               }
               |
               PolkaKing {
                 _pConst :: Int,
                 _pStr :: Int,
                 _pDex :: Int,
                 _pInt :: Int
               } deriving Eq

  data World = World {
                _mode :: String,
                _wHero :: Hero,
                _walls :: [String],
                _currentLvl :: String,
                _tileMap :: M.Map Coord Char,
                _wItems :: M.Map Coord Item,
                _wEnemies :: M.Map String [Enemy],
                _currEnemies :: [Enemy],
                _wStairs :: M.Map String [Staircase],
                _wInspects :: M.Map (Coord, String) [String],
                _wShops :: M.Map (Coord, String) (Item, Int),
                _wTraps :: M.Map String [Trap]
               } deriving Show

  data Enemy = Enemy {
                _eCoord :: Coord,
                _eOldCoord :: Coord,
                _eHealth :: Int
               } deriving (Show, Eq)

  data Hero = Hero {
                _hName :: String,
                _hCoord :: Coord,
                _hOldCoord :: Coord,
                _hHealth :: Int,
                _hDmg :: Int,
                _hExp :: Int,
                _hLvl :: Int,
                _hClass :: Class,
                _items :: [Item],
                _hScore :: Int,
                _hMoney :: Int,
                _hEffects :: [Effect]
              } deriving Show

  data Staircase = Staircase {
                    _sDir :: Char,
                    _sDest :: String,
                    _sCoord :: Coord
                   } deriving Show

  data Trap = Trap {
                _tEffect :: Effect,
                _tCoord :: Coord,
                _tDuration :: Int
              } deriving Show

  instance Show Class where
    show (Knight _ _ _ _) = "Knight"
    show (Thief _ _ _ _) = "Thief"
    show (Sub _ _ _ _) = "Sub"
    show (PolkaKing _ _ _ _) = "Polka King"

  instance Show Item where
    show Potion = "Potion"
    show Coin = "Coin"
    show Null = "Null"

  makeLenses ''World
  makeLenses ''Enemy
  makeLenses ''Hero
  makeLenses ''Staircase
  makeLenses ''Trap