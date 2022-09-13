% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1405.867097442497197 ; 1401.786703653891891 ];

%-- Principal point:
cc = [ 342.951492371223196 ; 245.129839510432134 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.586236385904432 ; 5.433132251583782 ; -0.002918959289201 ; 0.004373609145575 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 27.146339867171271 ; 26.789560305573996 ];

%-- Principal point uncertainty:
cc_error = [ 14.222153398603313 ; 14.380939215238241 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.121627697652717 ; 3.053419862824887 ; 0.002343528579501 ; 0.002069032230236 ; 0.000000000000000 ];

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
omc_1 = [ 2.124718e+00 ; 2.144369e+00 ; 2.304769e-01 ];
Tc_1  = [ -3.779499e+02 ; -2.651400e+02 ; 2.781730e+03 ];
omc_error_1 = [ 1.033024e-02 ; 1.005083e-02 ; 2.231814e-02 ];
Tc_error_1  = [ 2.830492e+01 ; 2.873628e+01 ; 5.429422e+01 ];

%-- Image #2:
omc_2 = [ -2.144497e+00 ; -2.192633e+00 ; -4.774163e-01 ];
Tc_2  = [ -3.485912e+02 ; -2.406874e+02 ; 2.618834e+03 ];
omc_error_2 = [ 7.489364e-03 ; 9.884742e-03 ; 1.897542e-02 ];
Tc_error_2  = [ 2.659832e+01 ; 2.708780e+01 ; 5.210592e+01 ];

%-- Image #3:
omc_3 = [ -1.934264e+00 ; -2.387996e+00 ; -4.354361e-01 ];
Tc_3  = [ -3.795397e+02 ; -2.967980e+02 ; 2.610651e+03 ];
omc_error_3 = [ 7.193782e-03 ; 1.046418e-02 ; 1.912506e-02 ];
Tc_error_3  = [ 2.657452e+01 ; 2.706336e+01 ; 5.226063e+01 ];

%-- Image #4:
omc_4 = [ 2.014431e+00 ; 2.063430e+00 ; 3.819217e-01 ];
Tc_4  = [ -3.419907e+02 ; -3.232686e+02 ; 2.638731e+03 ];
omc_error_4 = [ 8.782606e-03 ; 7.895773e-03 ; 1.745084e-02 ];
Tc_error_4  = [ 2.689733e+01 ; 2.723546e+01 ; 5.195856e+01 ];

%-- Image #5:
omc_5 = [ 2.062250e+00 ; 2.201977e+00 ; 2.255212e-01 ];
Tc_5  = [ -3.857425e+02 ; -3.162897e+02 ; 2.625873e+03 ];
omc_error_5 = [ 9.590669e-03 ; 1.008352e-02 ; 2.125527e-02 ];
Tc_error_5  = [ 2.679739e+01 ; 2.716337e+01 ; 5.137570e+01 ];

%-- Image #6:
omc_6 = [ 2.411066e+00 ; 1.844049e+00 ; 2.708259e-01 ];
Tc_6  = [ -4.734315e+02 ; -1.584306e+02 ; 2.604362e+03 ];
omc_error_6 = [ 1.074328e-02 ; 7.801862e-03 ; 2.173416e-02 ];
Tc_error_6  = [ 2.659558e+01 ; 2.697383e+01 ; 5.114983e+01 ];

%-- Image #7:
omc_7 = [ 1.946335e+00 ; 2.387181e+00 ; 5.076635e-01 ];
Tc_7  = [ -3.335448e+02 ; -2.572489e+02 ; 2.565772e+03 ];
omc_error_7 = [ 9.203962e-03 ; 8.145552e-03 ; 1.860773e-02 ];
Tc_error_7  = [ 2.607329e+01 ; 2.654057e+01 ; 5.125069e+01 ];

%-- Image #8:
omc_8 = [ -2.437604e+00 ; -1.926781e+00 ; -2.933809e-01 ];
Tc_8  = [ -4.637053e+02 ; -1.882430e+02 ; 2.670261e+03 ];
omc_error_8 = [ 1.083297e-02 ; 9.336276e-03 ; 2.227861e-02 ];
Tc_error_8  = [ 2.719170e+01 ; 2.768655e+01 ; 5.276789e+01 ];

%-- Image #9:
omc_9 = [ 1.852388e+00 ; 1.940907e+00 ; 5.913022e-01 ];
Tc_9  = [ -2.608967e+02 ; -2.774541e+02 ; 2.448948e+03 ];
omc_error_9 = [ 8.943370e-03 ; 7.112663e-03 ; 1.498146e-02 ];
Tc_error_9  = [ 2.491520e+01 ; 2.523835e+01 ; 4.904698e+01 ];

%-- Image #10:
omc_10 = [ 1.787083e+00 ; 2.522416e+00 ; -3.318297e-02 ];
Tc_10  = [ -2.609630e+02 ; -3.656078e+02 ; 2.770722e+03 ];
omc_error_10 = [ 1.043736e-02 ; 1.514374e-02 ; 2.767007e-02 ];
Tc_error_10  = [ 2.816583e+01 ; 2.852821e+01 ; 5.378917e+01 ];

%-- Image #11:
omc_11 = [ -1.882882e+00 ; -2.455672e+00 ; -2.003307e-01 ];
Tc_11  = [ -2.779638e+02 ; -3.501977e+02 ; 2.670268e+03 ];
omc_error_11 = [ 9.575332e-03 ; 1.304834e-02 ; 2.359529e-02 ];
Tc_error_11  = [ 2.714558e+01 ; 2.764210e+01 ; 5.257727e+01 ];

%-- Image #12:
omc_12 = [ 1.647636e+00 ; 2.283939e+00 ; 4.959397e-03 ];
Tc_12  = [ -2.481797e+02 ; -3.662779e+02 ; 2.761522e+03 ];
omc_error_12 = [ 6.792941e-03 ; 9.621141e-03 ; 1.747008e-02 ];
Tc_error_12  = [ 2.808160e+01 ; 2.841534e+01 ; 5.209937e+01 ];

%-- Image #13:
omc_13 = [ -2.194303e+00 ; -2.072544e+00 ; 6.772811e-02 ];
Tc_13  = [ -3.438769e+02 ; -2.692425e+02 ; 2.560553e+03 ];
omc_error_13 = [ 1.093879e-02 ; 1.020660e-02 ; 2.198143e-02 ];
Tc_error_13  = [ 2.600681e+01 ; 2.638963e+01 ; 4.887134e+01 ];

%-- Image #14:
omc_14 = [ 2.153152e+00 ; 2.112376e+00 ; 2.486338e-01 ];
Tc_14  = [ -2.515653e+02 ; -2.556824e+02 ; 2.378799e+03 ];
omc_error_14 = [ 9.132116e-03 ; 7.918918e-03 ; 1.832444e-02 ];
Tc_error_14  = [ 2.423607e+01 ; 2.454088e+01 ; 4.637134e+01 ];

%-- Image #15:
omc_15 = [ -2.302398e+00 ; -1.658203e+00 ; -1.527233e-01 ];
Tc_15  = [ -3.379148e+02 ; -1.418105e+02 ; 2.582644e+03 ];
omc_error_15 = [ 9.605456e-03 ; 8.041999e-03 ; 1.698939e-02 ];
Tc_error_15  = [ 2.623162e+01 ; 2.662013e+01 ; 4.868450e+01 ];

%-- Image #16:
omc_16 = [ 1.748100e+00 ; 2.426480e+00 ; 7.599767e-01 ];
Tc_16  = [ -8.226618e+01 ; -2.712073e+02 ; 2.403904e+03 ];
omc_error_16 = [ 9.415291e-03 ; 7.427564e-03 ; 1.681033e-02 ];
Tc_error_16  = [ 2.437690e+01 ; 2.478024e+01 ; 4.844874e+01 ];

