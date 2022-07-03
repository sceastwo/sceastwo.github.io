clear
clc
format long

plas_1 = 2.0; %Amount of plastic in toy 1
plas_2 = 4.0; %Amount of plastic in toy 2

metal_1 = 1.0; %Amount of metal in toy 1
metal_2 = 0.5; %Amount of metal in toy 2

cost_1 = 10.0;
cost_2 = 10.0;

price_1 = 15.00;
price_2 = 25.00;

cost_plas_kg = min(0.4*cost_1/plas_1, 0.4*cost_2/plas_2);
cost_metal_kg = min(0.4*cost_1/metal_1, 0.4*cost_2/metal_2);

plas_cost_1 = plas_1*cost_plas_kg;
plas_cost_2 = plas_2*cost_plas_kg;

metal_cost_1 = metal_1*cost_metal_kg;
metal_cost_2 = metal_2*cost_metal_kg;

labor_1 = cost_1 - plas_cost_1 - metal_cost_1;
labor_2 = cost_2 - plas_cost_2 - metal_cost_2;

profit_1 = price_1 - cost_1;
profit_2 = price_2 - cost_2;

budget = cost_1*1000 + cost_2*1000;
plas_limit = plas_1*0 + plas_2*1750;
metal_limit = metal_1*1750 + metal_2*0;

m_budget = -cost_1/cost_2;
c_budget = budget/cost_2;

m_plas = -plas_1/plas_2;
c_plas = plas_limit/plas_2;

m_metal = -metal_1/metal_2;
c_metal = metal_limit/metal_2;

A_budget = [-c_budget/m_budget, 0];
B_budget = [0, c_budget];

A_plas = [-c_plas/m_plas, 0];
B_plas = [0, c_plas];

A_metal = [-c_metal/m_metal, 0];
B_metal = [0, c_metal];

C = [(c_plas - c_budget)/(m_budget - m_plas), (m_budget*c_plas - m_plas*c_budget)/(m_budget - m_plas)];
D = [(c_metal - c_budget)/(m_budget - m_metal), (m_budget*c_metal - m_metal*c_budget)/(m_budget - m_metal)];
E = [(c_metal - c_plas)/(m_plas - m_metal), (m_plas*c_metal - m_metal*c_plas)/(m_plas - m_metal)];

vertex_1 = [0, 0];
vertex_2 = B_plas;
vertex_3 = A_metal;
vertex_4 = C;
vertex_5 = D;

z_1 = vertex_1 * [profit_1; profit_2];
z_2 = vertex_2 * [profit_1; profit_2];
z_3 = vertex_3 * [profit_1; profit_2];
z_4 = vertex_4 * [profit_1; profit_2];
z_5 = vertex_5 * [profit_1; profit_2];

price_1
labor_1
plas_1
metal_1

price_2
labor_2
plas_2
metal_2

cost_plas_kg
cost_metal_kg

budget
plas_limit
metal_limit

plas_cost_1
plas_cost_2

metal_cost_1
metal_cost_2

cost_1
cost_2

profit_1
profit_2

m_budget
c_budget

m_plas
c_plas

m_metal
c_metal

A_budget
B_budget

A_plas
B_plas

A_metal
B_metal

C
D
E

vertex_1
vertex_2
vertex_3
vertex_4
vertex_5

z_1
z_2
z_3
z_4
z_5




