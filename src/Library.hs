module Library where
import PdePreludat

type Horas = Number
type Presion = Number
type Fortaleza = String

presionGolpe :: Horas -> Fortaleza -> Presion
presionGolpe horas fortaleza = poder horas/ objetivo fortaleza

objetivo :: Fortaleza-> Number
objetivo = (*2) . length

poder :: Horas -> Number
poder = (*15)



type Golpe = Fortaleza -> Number

gomuGomu :: Golpe
gomuGomu = presionGolpe 180

normalesConsecutivos :: Golpe
normalesConsecutivos = presionGolpe 240

type Caractobjetivo = Fortaleza -> Bool
 
dificil :: Caractobjetivo
dificil fortaleza = ( (gomuGomu fortaleza) < 100) 

focalizarObjetivo :: Fortaleza -> Fortaleza
focalizarObjetivo fortaleza = take 7 fortaleza

accesible :: Caractobjetivo
accesible fortaleza =  ( normalesConsecutivos ( focalizarObjetivo fortaleza ) > 200) && ( normalesConsecutivos ( focalizarObjetivo fortaleza ) < 400)
