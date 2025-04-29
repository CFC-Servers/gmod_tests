This directory contains _unit_ tests - which verify individual units of code (i.e. functions/methods) in isolation.

These are in contrast to an integration test, which verify how those units interact and work together.

For example, a unit test would verify that `CTakeDamageInfo:SetDamage( number )` makes it so that `CTakeDamageInfo:GetDamage()` will return `number`, whereas an integration test might verify that setting the damage actually _applies_ the correct amount of damage to an Entity.
