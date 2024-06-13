defmodule Helpdesk.Support.ProgrammingLanguage do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    domain: Helpdesk.Support

  alias Uniq.UUID

  actions do
    default_accept [:name]
    defaults [:read, :destroy, create: :*, update: :*]
  end

  attributes do
    uuid_primary_key :id, default: &UUID.uuid7/0
    attribute :name, :string, allow_nil?: false
  end

  identities do
    identity :name, [:name]
  end

  postgres do
    table "programming_languages"
    repo Helpdesk.Repo
  end
end
