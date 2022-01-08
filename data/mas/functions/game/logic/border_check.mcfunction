# BORDER CHECK
#  Purpose:
#    Ensures players stay within the map bounds.
#  End Effect:
#    TP's the border marker to the player if they are within bounds, TP's the player to the marker if not.
#  Called by:
#    game/logic/marker_check
#  Additional notes:
#    We use this TP method to avoid manually checking which bound the player has violated (+x,-x,+y,-y,+z,-z)
#    and instead just TP the player back to their last in-bounds position.
#    @s represents the marker, @p represents the player.

#WITHIN MAP RANGE
execute if score @p[predicate=mas:maps/in_range] mas.ids = @s mas.ids run tp @s @p

#OUTSIDE MAP RANGE
execute unless score @p[predicate=mas:maps/in_range] mas.ids = @s mas.ids run tp @p @s