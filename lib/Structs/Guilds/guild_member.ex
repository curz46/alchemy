defmodule Alchemy.GuildMember do
  alias Alchemy.User
  alias Alchemy.Role
  import Alchemy.Structs.Utility
  @moduledoc """
  """
  @type t :: %__MODULE__{
    user: User.t,
    nick: String.t | nil,
    roles: [Role.t],
    joined_at: String.t | nil,
    deaf: Boolean,
    mute: Boolean
  }
  @derive Poison.Encoder
  defstruct [:user,
             :nick,
             :roles,
             :joined_at,
             :deaf,
             :mute]

  def from_map(map) do
    map
    |> Map.get_and_update("user", &(to_struct(&1, User)))
    |> to_struct(GuildMember)
  end
end
