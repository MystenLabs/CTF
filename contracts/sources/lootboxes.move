module ctf::lootboxes;

use sui::random::{Self, Random};
use ctf::flag;

#[allow(lint(public_random))]
public fun open_lootbox(r: &Random, ctx: &mut TxContext): Option<flag::Flag> {
  let mut generator = random::new_generator(r, ctx); // generator is a PRG
  let random_value = generator.generate_u8_in_range(1, 100);

  if (random_value == 42) {
    option::some(flag::new(b"lootbox".to_string(), ctx))
  } else {
    option::none()
  }
}
