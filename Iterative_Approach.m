%Del Vee Comp Script
del_v = 7400;
f_one = linspace(.3,.7,100);
f_two = ones(1,length(f_one))-f_one;

%% Top stage
%Raptor Vacuum Engine Performance
go = 9.80665;
ISP = 375; %assume vacuum performance
thrust = 1900e3; %kn
m_dot = thrust/(go*ISP);
ve = ISP*go;
m_pay = 27000; %kg
m_init_upper = [];
m_final_upper = [];
m_init_lower = [];
m_final_lower = [];

for i = 1:length(f_two)

    [~,~,m_final_upper,m_init_upper] = mass_vals(f_two(i)*del_v,375,.1,27000);
    [~,~,m_final_lower,m_init_lower] = mass_vals(f_one(i)*del_v,290,.07,m_init_upper);
    total_mass(i) = m_init_lower+m_init_upper;
end

plot(f_two,total_mass)
    
    
    
    
    
    
    