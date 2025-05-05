import Foundation

// MARK: - Moore's Law Core Functions

/**
 Calculates the number of transistors based on Moore's Law
 - Parameters:
   - initialCount: Starting number of transistors
   - years: Number of years since initial count
   - doublingPeriod: Years required for transistor count to double (default: 2)
 - Returns: Projected number of transistors
 */
func calculateTransistors(initialCount: Int, years: Int, doublingPeriod: Int = 2) -> Int {
    let numberOfDoublings = Double(years) / Double(doublingPeriod)
    return Int(Double(initialCount) * pow(2.0, numberOfDoublings))
}

/**
 Calculates the computational power increase based on Moore's Law
 - Parameters:
   - initialPower: Starting computational power metric
   - years: Number of years since initial measurement
   - doublingPeriod: Years required for power to double (default: 2)
 - Returns: Projected computational power
 */
func calculateComputationalPower(initialPower: Double, years: Double, doublingPeriod: Double = 2.0) -> Double {
    let numberOfDoublings = years / doublingPeriod
    return initialPower * pow(2.0, numberOfDoublings)
}

/**
 Calculates how many years it will take to reach a target transistor count
 - Parameters:
   - initialCount: Starting number of transistors
   - targetCount: Desired number of transistors
   - doublingPeriod: Years required for transistor count to double (default: 2)
 - Returns: Years required to reach target
 */
func yearsToReachTransistorCount(initialCount: Int, targetCount: Int, doublingPeriod: Double = 2.0) -> Double {
    let doublings = log2(Double(targetCount) / Double(initialCount))
    return doublings * doublingPeriod
}

/**
 Calculates the actual doubling period based on observed transistor counts
 - Parameters:
   - initialCount: Starting number of transistors
   - currentCount: Current number of transistors
   - years: Years elapsed between counts
 - Returns: Actual doubling period in years
 */
func calculateActualDoublingPeriod(initialCount: Int, currentCount: Int, years: Double) -> Double {
    let doublings = log2(Double(currentCount) / Double(initialCount))
    return years / doublings
}

// MARK: - Usage Examples

// Historical reference: Intel 4004 (1971) had approximately 2,300 transistors
let initialTransistorCount = 2300

// Calculating for 2025 (54 years since 1971)
let yearsSince1971 = 54
let transistorCount2025 = calculateTransistors(initialCount: initialTransistorCount, years: yearsSince1971)
print("Estimated number of transistors in 2025: \(transistorCount2025)")

// Calculating for Apple M1 Ultra which has approximately 114 billion transistors
let m1UltraTransistors = 114_000_000_000
let yearsToReach = yearsToReachTransistorCount(initialCount: initialTransistorCount, targetCount: m1UltraTransistors)
print("Years required to reach Apple M1 Ultra transistor count from 1971: \(yearsToReach)")

// Calculate actual doubling period based on observed data
let actualDoublingPeriod = calculateActualDoublingPeriod(initialCount: initialTransistorCount, 
                                                         currentCount: m1UltraTransistors, 
                                                         years: 51) // From 1971 to 2022 (M1 Ultra release)
print("Actual doubling period based on historical data: \(actualDoublingPeriod) years")

// MARK: - Advanced Usage: Technology Forecasting

/**
 Predicts technological performance across multiple metrics
 - Parameters:
   - baseMetrics: Dictionary of metric names and their base values
   - years: Years to project forward
   - customDoublingPeriods: Optional dictionary of custom doubling periods for specific metrics
   - defaultDoublingPeriod: Default doubling period to use when not specified (default: 2.0)
 - Returns: Dictionary of projected metric values
 */
func forecastTechnology(baseMetrics: [String: Double], 
                        years: Double,
                        customDoublingPeriods: [String: Double] = [:],
                        defaultDoublingPeriod: Double = 2.0) -> [String: Double] {
    
    var projectedMetrics: [String: Double] = [:]
    
    for (metric, baseValue) in baseMetrics {
        let doublingPeriod = customDoublingPeriods[metric] ?? defaultDoublingPeriod
        let projectedValue = calculateComputationalPower(initialPower: baseValue, 
                                                        years: years, 
                                                        doublingPeriod: doublingPeriod)
        projectedMetrics[metric] = projectedValue
    }
    
    return projectedMetrics
}

// Example: Forecasting multiple technology metrics
let baseMetrics = [
    "transistorCount": 2_000_000_000.0,  // 2 billion transistors (circa 2010)
    "cpuClockSpeed": 3.0,                // 3 GHz
    "memoryCapacity": 8.0,               // 8 GB
    "storageCapacity": 1000.0            // 1 TB
]

let customDoublingPeriods = [
    "transistorCount": 2.0,     // Classic Moore's Law
    "cpuClockSpeed": 6.0,       // Clock speeds grow more slowly
    "memoryCapacity": 3.0,      // Memory capacity grows moderately
    "storageCapacity": 1.5      // Storage grows faster
]

let projectedTech2030 = forecastTechnology(baseMetrics: baseMetrics,
                                          years: 10.0,
                                          customDoublingPeriods: customDoublingPeriods)

print("\nTechnology forecast for 2030:")
for (metric, value) in projectedTech2030.sorted(by: { $0.key < $1.key }) {
    print("\(metric): \(value)")
}