import Foundation

// MARK: - Core Models

/// Calculates power using a modified inverse logarithmic relationship
/// - Parameters:
///   - frequency: The input frequency value
///   - wavelength: The reference wavelength
///   - timeConstant: Time constant representing doubling period (in years)
/// - Returns: The calculated power value
func calculatePower(from frequency: Double, to wavelength: Double, timeConstant: Double = 2.0) -> Double {
    // Base relationship between frequency and wavelength
    let baseRatio = frequency / wavelength
    
    // Apply modified logarithmic scaling based on Moore's Law concept
    // (doubling/halving relationship with time constant)
    return pow(2, -1 * log2(baseRatio) / timeConstant)
}

// MARK: - Advanced Models

/// Calculates power with bandwidth consideration
/// - Parameters:
///   - frequency: The input frequency value
///   - wavelength: The reference wavelength
///   - bandwidth: The bandwidth value affecting the calculation
///   - timeConstant: Time constant representing doubling period (in years)
/// - Returns: The calculated power value with bandwidth adjustment
func calculatePower(from frequency: Double, to wavelength: Double, 
                    for bandwidth: Int, timeConstant: Double = 2.0) -> Double {
    // Adjust wavelength by bandwidth factor
    let adjustedWavelength = wavelength / Double(bandwidth)
    
    // Calculate adjusted ratio
    let adjustedRatio = frequency / adjustedWavelength
    
    // Apply modified logarithmic scaling with bandwidth-dependent time constant
    return pow(2, -1 * log2(adjustedRatio) / (timeConstant * Double(bandwidth)))
}

// MARK: - Extended Models

/// Calculates power with scaling factor
/// - Parameters:
///   - frequency: The input frequency value
///   - wavelength: The reference wavelength
///   - bandwidth: The bandwidth value affecting the calculation
///   - multiplier: Scaling factor for the power value
///   - timeConstant: Time constant representing doubling period (in years)
/// - Returns: The calculated power value with scaling
func calculatePower(from frequency: Double, to wavelength: Double, 
                    for bandwidth: Int, multiplier: Double, timeConstant: Double = 2.0) -> Double {
    return calculatePower(from: frequency, to: wavelength, 
                          for: bandwidth, timeConstant: timeConstant) * multiplier
}

// MARK: - Simplified Models

/// Calculates power using a default pi-based wavelength
/// - Parameters:
///   - frequency: The input frequency value
///   - multiplier: Scaling factor for the power value
///   - timeConstant: Time constant representing doubling period (in years)
/// - Returns: The calculated power value with default wavelength
func calculatePower(from frequency: Double, multiplier: Double, timeConstant: Double = 2.0) -> Double {
    return calculatePower(from: frequency, to: Double.pi, timeConstant: timeConstant) * multiplier
}

/// Calculates power with bandwidth-adjusted wavelength
/// - Parameters:
///   - frequency: The input frequency value
///   - multiplier: Primary scaling factor
///   - bandwidth: The bandwidth value affecting the calculation
///   - timeConstant: Time constant representing doubling period (in years)
/// - Returns: The calculated power value with adjusted wavelength
func calculatePower(from frequency: Double, multiplier: Double, 
                    for bandwidth: Int, timeConstant: Double = 2.0) -> Double {
    // Generate a bandwidth-adjusted wavelength based on pi
    let adjustedWavelength = (Double(bandwidth) * Double.pi) / 2
    
    return calculatePower(from: frequency,
                          to: adjustedWavelength,
                          for: bandwidth, 
                          timeConstant: timeConstant) * multiplier
}

/// Calculates power with compound scaling
/// - Parameters:
///   - frequency: The input frequency value
///   - multiplier: Primary scaling factor
///   - bandwidth: The bandwidth value affecting the calculation
///   - multiplier2: Secondary scaling factor
///   - timeConstant: Time constant representing doubling period (in years)
/// - Returns: The calculated power value with compound scaling
func calculatePower(from frequency: Double, multiplier: Double, 
                    for bandwidth: Int, multiplier2: Double, timeConstant: Double = 2.0) -> Double {
    return calculatePower(from: frequency,
                          multiplier: multiplier,
                          for: bandwidth,
                          timeConstant: timeConstant) * multiplier2
}

// MARK: - Technology Advancement Models

/// Calculates expected performance based on Moore's Law projection
/// - Parameters:
///   - basePerformance: Initial performance metric
///   - years: Number of years to project forward
///   - doublingPeriod: Time in years for doubling (default 2.0 for Moore's Law)
/// - Returns: Projected performance after specified years
func projectedPerformance(from basePerformance: Double, after years: Double, 
                          doublingPeriod: Double = 2.0) -> Double {
    return basePerformance * pow(2, years / doublingPeriod)
}

/// Calculates the time needed to reach a target performance level
/// - Parameters:
///   - basePerformance: Initial performance metric
///   - targetPerformance: Desired performance level
///   - doublingPeriod: Time in years for doubling (default 2.0 for Moore's Law)
/// - Returns: Time in years to reach the target performance
func timeToReachPerformance(from basePerformance: Double, to targetPerformance: Double,
                            doublingPeriod: Double = 2.0) -> Double {
    return log2(targetPerformance / basePerformance) * doublingPeriod
}

/// Calculates effective doubling period based on observed performance changes
/// - Parameters:
///   - initialPerformance: Performance at starting point
///   - currentPerformance: Performance at ending point
///   - years: Number of years between measurements
/// - Returns: Effective doubling period in years
func effectiveDoublingPeriod(from initialPerformance: Double, to currentPerformance: Double,
                             over years: Double) -> Double {
    return years / log2(currentPerformance / initialPerformance)
}