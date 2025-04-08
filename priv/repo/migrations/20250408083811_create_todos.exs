defmodule VuejsIntegration.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :completed, :boolean, default: false, null: false
      add :title, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
