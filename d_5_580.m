addpath( genpath( '/Users/bersiskutay/Documents/MATLAB/MNPBEM17' ) );

epsb  = epsconst( 1 );
epsAg = epstable( 'silver.dat' );
epsAu = epstable( 'gold.dat' );

epstab = { epsb, epsAu, epsAg };


% ====================================


partic = trisphere(400 , 100);

partic1 = scale(partic,[1 0.1 0.1]);
partic_1 = shift(partic1,[-52.5 , 0, 0]);


partic2 = scale(partic,[1 0.1 0.1]);
partic_2 = shift(partic2,[52.5, 0, 0 ]);

p3 = comparticle( epstab, {partic_1, partic_2} , [  2,1 ; 2,1 ], 1,2 );







exc = planewaveret( [ 1, 0, 0 ], [ 0, 0, 1 ] );

bem = bemret( p3 );
%surface charge
enei = 580 ;
sig = bem \ exc( p3, enei );
% exxamine sig: sig1 sig2 h1 h2

% sca = exc.sca( sig );                                
% ext = exc.ext( sig );

figure(41)
%  plot surface charge at boundary outside
plot( p3, real( sig.sig2 ) );% real part is physical
%question: why complex functions?
axis on
xlabel('x'); ylabel('y'); zlabel('z'); 
title('Distance = 5nm & Wavelength = 580nm ')
%axis([-100 100 -100 100 -50 50 ])
colorbar