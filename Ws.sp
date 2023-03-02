#include <sourcemod>

enum WeaponTypes

{

    WEAPON_TYPE_KNIFE = 0,

    WEAPON_TYPE_GLOVE,

    WEAPON_TYPE_MAX

};

enum Gloves

{

    GLOVES_DEFAULT = 0,

    GLOVES_SPORTY,

    GLOVES_SLICK,

    GLOVES_LEATHER_WRAP,

    GLOVES_MOTORCYCLE,

    GLOVES_SPECIALIST,

    GLOVES_HYDRA,

    GLOVES_MAX

};

const char *glovesNames[GLOVES_MAX] =

{

    "Default",

    "Sporty",

    "Slick",

    "Leather Wrap",

    "Motorcycle",

    "Specialist",

    "Hydra"

};

enum Knives

{

    KNIFE_DEFAULT = 0,

    KNIFE_BAYONET,

    KNIFE_FLIP,

    KNIFE_GUT,

    KNIFE_KARAMBIT,

    KNIFE_M9_BAYONET,

    KNIFE_HUNTSMAN,

    KNIFE_FALCHION,

    KNIFE_BUTTERFLY,

    KNIFE_SHADOW_DAGGERS,

    KNIFE_MAX

};

const char *knifeNames[KNIFE_MAX] =

{

    "Default",

    "Bayonet",

    "Flip Knife",

    "Gut Knife",

    "Karambit",

    "M9 Bayonet",

    "Huntsman Knife",

    "Falchion Knife",

    "Butterfly Knife",

    "Shadow Daggers"

};

public Action OnClientSay(int client, const char[] szMsg[], bool bTeam)

{

    if (StrEqual(szMsg, "!gloves"))

    {

        ShowMenu(client, GLOVES);

    }

    else if (StrEqual(szMsg, "!knife"))

    {

        ShowMenu(client, KNIVES);

    }

    return Plugin_Continue;

}

enum MenuTypes

{

    GLOVES = 0,

    KNIVES

};

void ShowMenu(int client, MenuTypes type)

{

    new options[4][64];

    if (type == GLOVES)

    {

        for (int i = 0; i < GLOVES_MAX; i++)

        {

            format(options[i], sizeof(options[i]), "%s", glovesNames[i]);

        }

    }

    else if (type == KNIVES)

    {

        for (int i = 0; i < KNIFE_MAX; i++)

        {

            format(options[i], sizeof(options[i]), "%s", knifeNames[i]);

        }

    }

    new menu = CreateMenu("Choose your item", options, type == GLOVES ? GLOVES_MAX : KNIFE_MAX, "Select");

    DisplayMenu(client, menu, MenuHandler);

}

void MenuHandler(int client, int opt, int item)

{

    if (opt == 1) // Select

