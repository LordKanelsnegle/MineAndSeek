# BORDERS: MANSION MARKER
#  Purpose:
#    Decides whether to TP the player to the border marker or vice versa, using the Mansion predicate.
#    This essentially keeps the player within bounds by TPing them back regardless of which bound they left.
#  End Effect:
#    TP's the border marker to the player if the player is within the map bounds, or vice versa if not.
#  Called by:
#    game/maps/borders/mansion
#  Additional notes:
#    It may be possible to merge the marker checks using predicate alternatives, though I'm not sure of
#    the performance impact. TODO (medium): Explore this.
#    @s represents the marker, @p represents the player, so we can't do predicate checks - they have to be
#    entity checks that use a predicate.

#PLAYER IN RANGE
execute if entity @p[predicate=mas:maps/in_mansion_range] run tp @s @p

#PLAYER NOT IN RANGE
execute unless entity @p[predicate=mas:maps/in_mansion_range] run tp @p @s