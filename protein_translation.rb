class Translation
  def self.of_codon sequence
    CODON_TRANSLATIONS[sequence]
  end

  def self.of_rna strand
    translations = strand.scan(/[A-Z]{3}/).map { |part| of_codon(part) }
    
    if translations.all? { |codon| codon.nil? }
      raise InvalidCodonError.new(
        "Strand '#{strand}' is invalid as it contains no codons" )
    end

    stop_at = (translations.index('STOP') || translations.size) - 1

    translations[0..stop_at]
  end

  private

  CODON_TRANSLATIONS = 
    { 
      'UUU' => 'Phenylalanine', 
      'UUC' => 'Phenylalanine',
      'AUG' => 'Methionine', 
      'UUA' => 'Leucine', 
      'UUG' => 'Leucine',
      'UGU' => 'Cysteine', 
      'UGC' => 'Cysteine',
      'UCU' => 'Serine', 
      'UCC' => 'Serine', 
      'UCA' => 'Serine', 
      'UCG' => 'Serine',
      'UAU' => 'Tyrosine', 
      'UAC' => 'Tyrosine',
      'UGG' => 'Tryptophan',
      'UAA' => 'STOP', 
      'UAG' => 'STOP', 
      'UGA' => 'STOP'
    }
end

InvalidCodonError = Class.new(Exception)