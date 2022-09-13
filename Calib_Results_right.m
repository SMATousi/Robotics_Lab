% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1380.962754749608621 ; 1377.679413418403328 ];

%-- Principal point:
cc = [ 334.429820490252268 ; 231.732953884388223 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.443010788524429 ; 3.671606224976514 ; -0.002202754661960 ; 0.003253598036523 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 29.670050913654627 ; 29.232991446096523 ];

%-- Principal point uncertainty:
cc_error = [ 22.383519669751855 ; 14.907842882120628 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.118977329200212 ; 2.679174249297069 ; 0.002643656534397 ; 0.002890796368397 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 16;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.114185e+00 ; -2.137389e+00 ; 1.730174e-01 ];
Tc_1  = [ -4.305763e+02 ; -2.807973e+02 ; 2.932096e+03 ];
omc_error_1 = [ 1.309873e-02 ; 1.239744e-02 ; 2.625065e-02 ];
Tc_error_1  = [ 4.756888e+01 ; 3.191638e+01 ; 6.269902e+01 ];

%-- Image #2:
omc_2 = [ -2.034532e+00 ; -2.000628e+00 ; -7.261634e-02 ];
Tc_2  = [ -4.593452e+02 ; -2.561375e+02 ; 2.770832e+03 ];
omc_error_2 = [ 1.062245e-02 ; 1.216752e-02 ; 2.243490e-02 ];
Tc_error_2  = [ 4.499324e+01 ; 3.023606e+01 ; 6.045166e+01 ];

%-- Image #3:
omc_3 = [ -1.820848e+00 ; -2.162899e+00 ; -7.211710e-02 ];
Tc_3  = [ -4.907093e+02 ; -3.122564e+02 ; 2.774556e+03 ];
omc_error_3 = [ 9.633916e-03 ; 1.301800e-02 ; 2.167611e-02 ];
Tc_error_3  = [ 4.504998e+01 ; 3.031625e+01 ; 6.058670e+01 ];

%-- Image #4:
omc_4 = [ -2.185063e+00 ; -2.239202e+00 ; -3.418073e-03 ];
Tc_4  = [ -4.474846e+02 ; -3.383128e+02 ; 2.781996e+03 ];
omc_error_4 = [ 1.578270e-02 ; 1.520859e-02 ; 3.465023e-02 ];
Tc_error_4  = [ 4.525992e+01 ; 3.033552e+01 ; 6.060253e+01 ];

%-- Image #5:
omc_5 = [ -2.053718e+00 ; -2.194207e+00 ; 1.665405e-01 ];
Tc_5  = [ -4.946034e+02 ; -3.264049e+02 ; 2.787773e+03 ];
omc_error_5 = [ 1.240472e-02 ; 1.196661e-02 ; 2.520667e-02 ];
Tc_error_5  = [ 4.526431e+01 ; 3.042431e+01 ; 5.993010e+01 ];

%-- Image #6:
omc_6 = [ -2.394236e+00 ; -1.832661e+00 ; 2.070551e-01 ];
Tc_6  = [ -5.826500e+02 ; -1.694194e+02 ; 2.806070e+03 ];
omc_error_6 = [ 1.375756e-02 ; 9.358394e-03 ; 2.584134e-02 ];
Tc_error_6  = [ 4.550959e+01 ; 3.067054e+01 ; 6.034395e+01 ];

%-- Image #7:
omc_7 = [ -1.870596e+00 ; -2.207628e+00 ; -1.367067e-01 ];
Tc_7  = [ -4.665166e+02 ; -2.672964e+02 ; 2.714808e+03 ];
omc_error_7 = [ 9.693889e-03 ; 1.348465e-02 ; 2.292081e-02 ];
Tc_error_7  = [ 4.406844e+01 ; 2.964947e+01 ; 5.960710e+01 ];

%-- Image #8:
omc_8 = [ -2.288981e+00 ; -1.774845e+00 ; 1.740991e-01 ];
Tc_8  = [ -5.527660e+02 ; -1.941609e+02 ; 2.865418e+03 ];
omc_error_8 = [ 1.275255e-02 ; 9.636971e-03 ; 2.363118e-02 ];
Tc_error_8  = [ 4.649372e+01 ; 3.129773e+01 ; 6.127711e+01 ];

%-- Image #9:
omc_9 = [ 2.067506e+00 ; 2.163531e+00 ; 2.866812e-01 ];
Tc_9  = [ -4.419808e+02 ; -2.806413e+02 ; 2.567301e+03 ];
omc_error_9 = [ 1.233113e-02 ; 1.232946e-02 ; 2.519831e-02 ];
Tc_error_9  = [ 4.175746e+01 ; 2.807248e+01 ; 5.567917e+01 ];

%-- Image #10:
omc_10 = [ -1.655594e+00 ; -2.364625e+00 ; 3.254064e-01 ];
Tc_10  = [ -3.322788e+02 ; -3.684122e+02 ; 2.872208e+03 ];
omc_error_10 = [ 1.076455e-02 ; 1.304016e-02 ; 2.092507e-02 ];
Tc_error_10  = [ 4.662123e+01 ; 3.125199e+01 ; 5.956901e+01 ];

%-- Image #11:
omc_11 = [ -1.735591e+00 ; -2.222594e+00 ; 1.339564e-01 ];
Tc_11  = [ -3.813820e+02 ; -3.536591e+02 ; 2.789571e+03 ];
omc_error_11 = [ 1.008595e-02 ; 1.291446e-02 ; 2.071038e-02 ];
Tc_error_11  = [ 4.528790e+01 ; 3.037241e+01 ; 5.927305e+01 ];

%-- Image #12:
omc_12 = [ 1.752749e+00 ; 2.524437e+00 ; -3.211499e-01 ];
Tc_12  = [ -3.249812e+02 ; -3.631198e+02 ; 2.856171e+03 ];
omc_error_12 = [ 7.993068e-03 ; 1.454737e-02 ; 2.584276e-02 ];
Tc_error_12  = [ 4.637137e+01 ; 3.108329e+01 ; 5.960299e+01 ];

%-- Image #13:
omc_13 = [ -2.000899e+00 ; -1.871301e+00 ; 4.158839e-01 ];
Tc_13  = [ -4.843633e+02 ; -2.672255e+02 ; 2.700570e+03 ];
omc_error_13 = [ 1.220263e-02 ; 1.020571e-02 ; 1.995536e-02 ];
Tc_error_13  = [ 4.386896e+01 ; 2.946968e+01 ; 5.546690e+01 ];

%-- Image #14:
omc_14 = [ -2.152359e+00 ; -2.111152e+00 ; 1.599093e-01 ];
Tc_14  = [ -4.575007e+02 ; -2.535158e+02 ; 2.507983e+03 ];
omc_error_14 = [ 1.213765e-02 ; 1.111256e-02 ; 2.431615e-02 ];
Tc_error_14  = [ 4.067469e+01 ; 2.734549e+01 ; 5.395198e+01 ];

%-- Image #15:
omc_15 = [ -2.168078e+00 ; -1.473458e+00 ; 2.443539e-01 ];
Tc_15  = [ -4.723148e+02 ; -1.389590e+02 ; 2.720343e+03 ];
omc_error_15 = [ 1.162256e-02 ; 9.499112e-03 ; 1.975270e-02 ];
Tc_error_15  = [ 4.415972e+01 ; 2.965869e+01 ; 5.615262e+01 ];

%-- Image #16:
omc_16 = [ -1.761888e+00 ; -2.293579e+00 ; -4.249564e-01 ];
Tc_16  = [ -2.920228e+02 ; -2.679121e+02 ; 2.461748e+03 ];
omc_error_16 = [ 7.223036e-03 ; 1.404681e-02 ; 2.106361e-02 ];
Tc_error_16  = [ 3.997270e+01 ; 2.683317e+01 ; 5.549551e+01 ];

