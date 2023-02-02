using Microsoft.EntityFrameworkCore.Migrations;

namespace Shelter.Data.Migrations
{
    public partial class CreateDb : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AnimalParents",
                columns: table => new
                {
                    ParentID = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ParentName = table.Column<string>(nullable: true),
                    ParentSurname = table.Column<string>(nullable: true),
                    ParentJob = table.Column<string>(nullable: true),
                    ParentAge = table.Column<int>(nullable: false),
                    ParentPhone = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AnimalParents", x => x.ParentID);
                });

            migrationBuilder.CreateTable(
                name: "Animals",
                columns: table => new
                {
                    AnimalID = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AnimalType = table.Column<string>(nullable: true),
                    AnimalGender = table.Column<string>(nullable: true),
                    AnimalAge = table.Column<int>(nullable: false),
                    ParentID = table.Column<int>(nullable: false),
                    AnimalParentsParentID = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Animals", x => x.AnimalID);
                    table.ForeignKey(
                        name: "FK_Animals_AnimalParents_AnimalParentsParentID",
                        column: x => x.AnimalParentsParentID,
                        principalTable: "AnimalParents",
                        principalColumn: "ParentID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Animals_AnimalParentsParentID",
                table: "Animals",
                column: "AnimalParentsParentID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Animals");

            migrationBuilder.DropTable(
                name: "AnimalParents");
        }
    }
}
