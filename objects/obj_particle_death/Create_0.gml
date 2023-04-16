/// @description

depth = -y;

DeathParticle = part_system_create();
part_system_depth(DeathParticle, depth);

particle = part_type_create();
part_type_shape(particle, pt_shape_square);
part_type_size(particle,0.01,0.02,0,0);
part_type_color1(particle, c_white);
part_type_alpha2(particle, 1, -0.10);
part_type_speed(particle,0.1,0.3,0,0)
part_type_direction(particle,90,0,0,0);
part_type_gravity(particle,0.02,90);
part_type_life(particle,30,30);

emitter = part_emitter_create(DeathParticle);
part_emitter_region(DeathParticle, emitter, x-5, x+5, y-3, y+3, ps_shape_ellipse, ps_distr_gaussian);