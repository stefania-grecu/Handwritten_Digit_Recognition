## Copyright (C) 2021 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} magic_with_pca (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-08

function [train, miu, Y, Vk] = magic_with_pca (train_mat, pcs)
  [m, n] = size (train_mat);

  % initializare train
  train = zeros (m, n);

  % initializare miu
  miu = zeros (1, n);

  % initializare Y
  Y = zeros (m, pcs);

  % initializare Vk
  Vk = zeros (n, pcs);

  % TODO: cast train_mat la double.
  X = double(train_mat);

  % TODO: calculeaza media fiecarei coloane a matricii.
  for i = 1:n
    miu(1,i) = norm(X(:,i),1) / m;
  endfor

  % TODO: scade media din matricea initiala.
  X(:,1:n) = X(:,1:n) - miu(1:n);

  % TODO: calculeaza matricea de covarianta.
  cov_matrix = (X'*X) / (m - 1);

  % TODO: calculeaza vectorii si valorile proprii ale matricei de covarianta.
  % HINT: functia eig
  [V S] = eig(cov_matrix);

  % TODO: ordoneaza descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  B = diag(S);
  k = size(S,1);
  B = sort(B);
  v = V;

  for i = k:-1:1
    for j = 1:k
      if B(i) == S(j,j)
        V(:,k + 1 - i) = v(:,j);
      endif
    endfor
  endfor

  % TODO: pastreaza doar primele pcs coloane din matricea obtinuta anterior.
  Vk = V(:, 1:pcs);

  % TODO: creaza matricea Y schimband baza matricii initiale.
  Y = X * Vk;

  % TODO: calculeaza matricea train care este o aproximatie a matricii initiale
  % folosindu-va de matricea Vk calculata anterior
  train = Y * Vk';
endfunction
