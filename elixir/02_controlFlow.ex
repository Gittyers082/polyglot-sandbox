defmodule ControlFlow do
  @moduledoc """
  Modules, Functions, Pattern Matching, and Control Flow.
  """
  # Multi-Head Functions (Damage Multipliers)
  def calculate_damage(:fire, :grass, base_dmg), do: base_dmg * 2.0
  def calculate_damage(:water, :fire, base_dmg), do: base_dmg * 2.0
  def calculate_damage(:electric, :water, base_dmg), do: base_dmg * 1.5
  def calculate_damage(:fire, :water, base_dmg), do: base_dmg * 0.5

  # Default clause (Neutral damage)
  def calculate_damage(_attacker_elem, _defender_elem, base_dmg), do: base_dmg * 1.0

  # Guard Clauses (Rank & Class Evolution)
  def evaluate_rank(level) when is_integer(level) and level >= 70 do
    "Master Knight"
  end

  def evaluate_rank(level) when is_integer(level) and level >= 50 do
    "High Knight"
  end

  def evaluate_rank(level) when is_integer(level) and level >= 30 do
    "Knight"
  end

  def evaluate_rank(level) when is_integer(level) and level < 30 do
    "Squire"
  end

  # Safety net
  def evaluate_rank(_invalid), do: {:error, "Invalid level input. Please provide a valid positive integer."}

  # Case (Loot & Dungeon Rewards)
  def open_dungeon_chest(chest_result) do
    case chest_result do
      {:ok, :legendary, loot_name} ->
         "You have obtained a legendary item: #{loot_name}!"

      {:ok, :common, loot_name} ->
         "You have obtained a common item: #{loot_name}."

      {:trap, :mimic} ->
         "A mimic has appeared! Prepare for battle!"

      {:trap, poison_type} ->
         "Poison trap sprung! Afflicted with #{poison_type}."

      {:error, :locked} ->
         "The chest is locked shut. A chest key is required."
    end
  end

  # Cond (Health Status)
  def check_vitals(hp, max_hp) do
    percentage = (hp / max_hp) * 100

    cond do
      hp <= 0 -> "Your are dead. Game Over."
      percentage <= 20 -> "Critical health! Immediate healing required."
      percentage <= 50 -> "Health is low. Consider using a healing item."
      true -> "Health is moderate. Stay cautious."
    end
  end

  # Quest Pipeline ('with' construct)
  def embark_quest(player_level, gold_fee, current_gold) do
    with {:ok, :level_cleared} <- check_quest_level(player_level, 20),
         {:ok, :funds_cleared} <- check_entry_fee(gold_fee, current_gold) do
          remaining_gold = current_gold - gold_fee
          "Quest embarked successfully! Remaining gold: #{remaining_gold}."
    else
      {:error, :level_too_low} -> "Grandmarshall: Come back when you reach level 20."
      {:error, :insufficient_gold} -> "Grandmarshall: You don't have enough gold for the toll."
    end
  end

  defp check_quest_level(lvl, required) when lvl >= required, do: {:ok, :level_cleared}
  defp check_quest_level(_lvl, _required), do: {:error, :level_too_low}

  defp check_entry_fee(fee, gold) when gold >= fee, do: {:ok, :funds_cleared}
  defp check_entry_fee(_fee, _gold), do: {:error, :insufficient_gold}

  def start_quest do
    IO.puts("========================================")
    IO.puts("          KNIGHT ADVENTURE QUEST        ")
    IO.puts("========================================\n")

    # 1. Elemental Matchups
    IO.puts("[1] COMBAT CALCULATOR:")
    IO.puts("Fire vs Grass: #{calculate_damage(:fire, :grass, 100)} dmg")
    IO.puts("Water vs Fire: #{calculate_damage(:water, :fire, 100)} dmg")
    IO.puts("Fire vs Water: #{calculate_damage(:fire, :water, 100)} dmg")
    IO.puts("Dark vs Light (Neutral): #{calculate_damage(:dark, :light, 100)} dmg\n")

    # 2. Knight Ranks
    IO.puts("[2] KNIGHT RANK EVALUATION:")
    IO.puts("Level 5:  #{evaluate_rank(5)}")
    IO.puts("Level 25: #{evaluate_rank(25)}")
    IO.puts("Level 75: #{evaluate_rank(75)}")
    IO.inspect(evaluate_rank("Cheater"))
    IO.puts("")

    # 3. Chest Openings
    IO.puts("[3] DUNGEON LOOT DROP:")
    IO.puts(open_dungeon_chest({:ok, :legendary, "Dragon Slayer Greatsword"}))
    IO.puts(open_dungeon_chest({:trap, :mimic}))
    IO.puts(open_dungeon_chest({:error, :locked}))
    IO.puts(open_dungeon_chest({:ok, :common, "Ork Nutsack"}))
    IO.puts("")

    # 4. Status Check
    IO.puts("[4] VITALS SCANNER:")
    IO.puts(check_vitals(100, 100))
    IO.puts(check_vitals(15, 100))
    IO.puts(check_vitals(0, 100))
    IO.puts("")

    # 5. Quest Guild Attempt
    IO.puts("[5] GUILD QUEST REGISTRATION:")
    IO.puts(embark_quest(10, 50, 200))
    IO.puts(embark_quest(25, 100, 50))
    IO.puts(embark_quest(30, 50, 500))
  end



end

ControlFlow.start_quest()
