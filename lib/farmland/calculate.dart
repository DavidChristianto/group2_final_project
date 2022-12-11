import 'package:ariculture/farmland/farmland.dart';


List<int> caluclate(landSize, crop) {
    Map<String, int> dictPlantSpace = {
        'PD': 0.04,
        'JG': 0.14,
        'KT': 0.06,
        'SK': 0.96,
        'UJ': 0.25,
        'KE': 0.15,
        'WO': 0.01,
        'BW': 0.04,
        'TM': 0.28,
        'PS': 9,
        'JR': 20,
    };

    Map<String, Map<String, int> dictRecFert = {
        'PD': {"U": 200, "S": 100, "K": 75},
        'JG': {"U": 350, "S": 200, "K": 100},
        'KT': {"U": 100, "S": 100, "K": 50},
        'SK': {"U": 200, "S": 50, "K": 75},
        'UJ': {"U": 150, "S": 100, "K": 100},
        'KE': {"U": 350, "S": 200, "K": 400},
        'WO': {"U": 100, "S": 100, "K": 30},
        'BW': {"U": 350, "S": 100, "K": 50},
        'TM': {"U": 250, "S": 300, "K": 300},
        'PS': {"U": 350, "S": 150, "K": 150},
        'JR': {"U": 200, "S": 150, "K": 75},
    };

    Map<String, int> dictWeight = {
        'PD': 5.7,
        'JG': 6.4,
        'KT': 1.5,
        'SK': 20,
        'UJ': 12,
        'KE': 16,
        'WO': 20,
        'BW': 9.5,
        'TM': 25,
        'PS': 28,
        'JR': 27,
    };

    Map<String, int> dictRateSell = {
        'PD': 4,
        'JG': 4.6,
        'KT': 8,
        'SK': 1.1,
        'UJ': 5,
        'KE': 15,
        'WO': 4,
        'BW': 25,
        'TM': 5,
        'PS': 1.5,
        'JR': 5,
    };

    final int plantSpace = dictPlantSpace[crop];
    final int amount_of_plants = (size/plantSpace).floor();

    final int urea1_needed = dictRecFert[crop]['U']*(size/10000);
    final int sP36_needed = dictRecFert[crop]['S']*(size/10000);
    final int kCl_needed = dictRecFert[crop]['K']*(size/10000);

    final int weight = dictWeight[plant];
    final int expected_yield = ((size/10000) * (weight*1000)).ceil();

    final int rate_sell = dictRateSell[plant];
    final int gross_income = (expected_yield * rate_sell * 1000).ceil();

    final int net_income = (gross_income - ((urea1_needed * 13000) + (sP36_needed * 15000) + (kCl_needed * 20000))).ceil();

    return [amount_of_plants, urea1_needed, sP36_needed, kCl_needed, expected_yield, gross_income, net_income]
}

