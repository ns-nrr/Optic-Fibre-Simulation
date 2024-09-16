% Optical fiber simulation script

% Define simulation parameters
fiber_length = 100; % m
wavelength = 1550; % nm
input_power = 1e-3; % mW

% Create optical fiber object
fiber_object = opticalFiber('length', fiber_length, 'attenuation', 0.2);

% Calculate attenuation over fiber length
fiber_attenuation = fiber_object.getAttenuation(fiber_length);

% Calculate chromatic dispersion at given wavelength
fiber_dispersion = fiber_object.getDispersion(wavelength);

% Calculate mode field diameter at given wavelength
fiber_mode_field_diameter = fiber_object.getModeFieldDiameter(wavelength);

% Print simulation results
fprintf('Fiber attenuation: %.2f dB\n', 10*log10(fiber_attenuation));
fprintf('Chromatic dispersion: %.2f ps/nm/km\n', fiber_dispersion*1e12);
fprintf('Mode field diameter: %.2f um\n', fiber_mode_field_diameter);
