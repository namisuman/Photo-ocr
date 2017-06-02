function TestDataTesting(X)
load AtoZparams;
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 100; %
hidden_layer_size2 = 100;  % 25 hidden units
num_labels = 26; 
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):((hidden_layer_size * (input_layer_size + 1))+(hidden_layer_size2*(hidden_layer_size+1)))), ...
                 hidden_layer_size2, (hidden_layer_size + 1));
Theta3 = reshape(nn_params((1+(hidden_layer_size * (input_layer_size + 1))+(hidden_layer_size2*(hidden_layer_size+1))):end), ...
                 num_labels, (hidden_layer_size2 + 1));
pred = predict(Theta1, Theta2,Theta3, X);
predictedChar=(char)(pred.+64)
