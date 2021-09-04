module Lista2 where

pertence _ [] = False
pertence y (x:xs) = if x == y then True else pertence y xs 

intercessao [] _ = []
intercessao _ [] = []
intercessao (x:xs) n
                | pertence x (x:xs) && pertence x n = x : intercessao xs n
                | otherwise = intercessao xs n
                
inversoLista [] = []
inversoLista ls = last ls : inversoLista(init ls)    

nUltimos _ [] = []
nUltimos n (x:xs) | (1+length xs) < n = x:xs
                  | (length xs) == n = xs
                  | otherwise = nUltimos n xs

enesimo _ [] = -1
enesimo 0 _ = -1
enesimo y (x:xs)  | y-1 <= 0 = x
                  | otherwise = enesimo (y-1) xs

repetir 0 _ = []
repetir n x = x : repetir (n - 1) x

intercalacao xs [] = xs
intercalacao [] ys = ys
intercalacao (x:xs) (y:ys) 
          | (x <= y)  = x:(intercalacao xs (y:ys)) 
          | otherwise = y:(intercalacao (x:xs) ys)

menor [x] = x
menor (x:y:resto) | x < y = menor (x: resto)
                  | otherwise = menor (y: resto)

removerElem _ [] = []
removerElem e (x:xs)   
            | (x == e) = xs
            | otherwise = x : removerElem e xs

ordenarLista [] = []
ordenarLista lista = auxOrd [] lista
auxOrd lista [] = lista
auxOrd lista (x:xs) = auxOrd (lista++[menor (x:xs)]) (removerElem (menor (x:xs)) (x:xs))

insereElem e [] = [e]
insereElem e (x:xs)
            | e == x = (x:xs)
            | e <= x = e:(x:xs)
            | otherwise = x : insereElem e xs

primeirosDuplas [] = []
primeirosDuplas (x:xs) = fst x : primeirosDuplas xs

somaDuplas [] = []
somaDuplas (x:xs) = fst x + snd x : somaDuplas xs

menoresDuplas [] = []
menoresDuplas (x:xs) | fst x < snd x = (fst x, snd x) : menoresDuplas xs
                     | otherwise = menoresDuplas xs

separarDuplas _ [] = ([], []) 
separarDuplas v a = ([x | x <- a, x<=v],[y | y <- a, y>v]) 

mdc (a, b) | b > 0 = mdc (b, (mod a b))
           | b == 0 = a
           | otherwise = mdc (b, a)

inversoDupla [] = []
inversoDupla (x:xs) = (snd x, fst x): inversoDupla xs

simetrico [] = []
simetrico (x:xs) | fst x == snd x = True :simetrico xs
                 | fst x /= snd x = False :simetrico xs
                 | otherwise = simetrico xs

pares n = [(x,y) | x <- [1..n], y <- [1..n], x/=y]

inverteDNA x = inverteDNA' (inversoLista x)
inverteDNA' [] = []
inverteDNA' (x:xs) | x == 'A' = 'T' : inverteDNA' xs
                   | x == 'T' = 'A' : inverteDNA' xs
                   | x == 'C' = 'G' : inverteDNA' xs
                   | x == 'G' = 'C' : inverteDNA' xs
                   | otherwise = inverteDNA' xs 

trocoCafe a b = trocoCafe' (b-a) [50,20,10,5]
trocoCafe' _ [] = []
trocoCafe' valor (x:xs) = if valor `div` x > 0 then (x, valor`div`x): trocoCafe' (valor `rem` x)  xs else trocoCafe' valor xs

magica xs = magica' xs (length xs) ++ inversoLista (init (magica' xs (length xs)))
magica' [] _ = []
magica' (x:xs) t = repetir t x ++ magica' xs (t-1)
