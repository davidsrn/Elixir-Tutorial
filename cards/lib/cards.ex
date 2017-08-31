defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards.
  """

  @doc """
    Return a list of strings that represent a whole deck
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "J", "Q", "R"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    #cards = for value <- values do
    #  for suit <- suits do
    #    "#{value} of #{suit}"
    #  end
    #end
    #List.flatten(cards)
    for suit <- suits , value <- values  do
      "#{value} of #{suit}"
    end
  end

  def shuffle deck do
    Enum.shuffle deck
  end
  @doc """
    Determines if a `deck` has a specific `Card`.
  ## Examples
    iex> deck = Cards.create_deck
    iex> Cards.contains?(deck, "Ace of Spades")
    true

  """
  def contains? deck, card do
    Enum.member?deck, card
  end
  @doc """
    Divides a deck into a `hand_size`.

  ## Example

      iex> deck= Cards.create_deck
      iex> {hand,deck} = Cards.deal(deck,1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal deck, hand_size do
    Enum.split deck, hand_size
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary deck
    File.write filename, binary
  end

  def load filename do
    case File.read filename do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "Something went wrong"
    end
  end

  def create_hand hand_size do
    #deck = Cards.create_deck
    #deck = Cards.shuffle deck
    #hand = Cards.deal deck, hand_size
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
#-----------------------------------------------------EOF-----------------------------------------------------#
end
