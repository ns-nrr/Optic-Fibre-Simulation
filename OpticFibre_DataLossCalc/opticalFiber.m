classdef opticalFiber < handle
    %OPTICALFIBER Class definition for an optical fiber object
    %   Detailed explanation goes here
    
    properties
        length
        attenuation
        modeFieldDiameter
        numericalAperture
    end
    
    methods
        function obj = opticalFiber(varargin)
            %OPTICALFIBER Construct an instance of this class
            %   Detailed explanation goes here
            %   Initialize with parameter/value pairs:
            %   length (m), attenuation (dB/m), modeFieldDiameter (um), numericalAperture
            
            % Initialize default property values
            obj.length = 1;
            obj.attenuation = 0.2;
            obj.modeFieldDiameter = 9.8;
            obj.numericalAperture = 0.12;
            
            % Parse input arguments to update properties
            for i = 1:2:nargin
                if isprop(obj, varargin{i})
                    obj.(varargin{i}) = varargin{i+1};
                else
                    error('Invalid property: %s', varargin{i});
                end
            end
        end
        
        function output = getAttenuation(obj, length)
            %GETATTENUATION Calculate the attenuation over a given length
            %   Detailed explanation goes here
            output = obj.attenuation * length / obj.length;
        end
        
        function output = getDispersion(obj, wavelength)
            %GETDISPERSION Calculate the chromatic dispersion at a given wavelength
            %   Detailed explanation goes here
            output = (1.027e-4 * obj.modeFieldDiameter^2 * (obj.numericalAperture^2) * (wavelength^2)) ./ (obj.length * (wavelength^2 - (obj.modeFieldDiameter^2)*(obj.numericalAperture^2)));
        end
        
        function output = getModeFieldDiameter(obj, wavelength)
            %GETMODEFIELDDIAMETER Calculate the mode field diameter at a given wavelength
            %   Detailed explanation goes here
            output = obj.modeFieldDiameter * sqrt((wavelength^2 - 1.3e-5) / (obj.modeFieldDiameter^2 - 1.3e-5));
        end
    end
end
